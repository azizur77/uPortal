package org.jasig.portal;

import java.util.Vector;

/**
 * Stylesheet description for stylesheets performing theme transformation
 * @author Peter Kharchenko
 * @version $Revision$
 */

public class ThemeStylesheetDescription extends CoreXSLTStylesheetDescription {
    // vector holds the list of first stage stylesheets that can be used with the current stylesheet
    protected Vector structureStylesheets;

    public Vector getStructureStylesheetList() { return structureStylesheets; }
    public void setStructureStylesheetList(Vector list) {
	structureStylesheets=list;
    }
}
