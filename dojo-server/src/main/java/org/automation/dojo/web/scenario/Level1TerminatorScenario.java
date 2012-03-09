package org.automation.dojo.web.scenario;

import org.automation.dojo.BugsQueue;
import org.automation.dojo.web.bugs.Bug;
import org.automation.dojo.web.servlet.RequestWorker;

import java.util.Arrays;
import java.util.List;

public class Level1TerminatorScenario extends TerminatorScenario {

    public Level1TerminatorScenario(int id, String description, BugsQueue bugsQueue) {
        super(id, description, bugsQueue);
    }

    @Override
    public boolean activate(RequestWorker request) {
        return request.isSearchAction();
    }

    @Override
    protected String getUrl() {
        return "search_level1.jsp";
    }

}
