package org.automation.dojo.web.bugs;

import org.automation.dojo.web.servlet.RequestWorker;

/**
 * Просто отключаем джаваскриптовую валидацию
 */
public class DisabledPriceValidationBug extends Bug<RequestWorker> {

    public DisabledPriceValidationBug(int id) {
        super(id);
    }

    @Override
    public RequestWorker apply(RequestWorker result) {
        result.setValidatePriceNumber(false);
        return result;
    }

}
