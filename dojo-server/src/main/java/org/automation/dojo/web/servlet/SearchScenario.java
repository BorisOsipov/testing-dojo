package org.automation.dojo.web.servlet;

import org.automation.dojo.BugsQueue;
import org.automation.dojo.Scenario;
import org.automation.dojo.web.model.Record;
import org.automation.dojo.web.model.ShopService;
import org.automation.dojo.web.model.ShopServiceFactory;

import java.util.List;

public class SearchScenario extends Scenario {

    public SearchScenario(int id, String description, BugsQueue bugsQueue) {
        super(id, description, bugsQueue);
    }

    @Override
    protected String process() {
        ShopService service = ShopServiceFactory.gtInstance();

        request.saveFormState();

        String foundString = request.getSearchText();
        if (foundString != null) {
            List<Record> result = service.select(foundString, request.getPriceOptionIndex(), request.getPrice());

            if (result.isEmpty()) {
                result = service.select("", ShopService.IGNORE, 0);
                request.noResultsFound();
            }

            request.setRecords(result);
        }

        return "search.jsp";
    }

}