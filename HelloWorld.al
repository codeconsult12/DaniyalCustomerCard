// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 InteractionLog extends "Interaction Log Entries"
{
    layout
    {



        addafter("Date")
        {
            field("CallInitationTime"; Rec."Time of Interaction")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call Initation Time';
                Visible = Not isWelcomeCompany;


            }
            field("CallEndTime"; Rec.CallEndTime)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call End Time';
                Visible = Not isWelcomeCompany;


            }
            // field("PatientPhone"; Rec.PatientPhone)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Patient Phone';

            // }


        }
        addafter(Description)
        {
            field("PatientName"; Rec.PatientName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Patient Name';
                Visible = Not isWelcomeCompany;
            }
        }

        addafter("PatientName")

        {
            field("ContactNo"; Rec.PatientPhone)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Patient Phone';
                Visible = Not isWelcomeCompany;

            }


        }
        addafter("Description")
        {
            field("PatientId"; Rec.PatientId)
            {

                ApplicationArea = Basic, Suite;
                Caption = 'Patient ID';
                // TableRelation = Customer.Name;
                Visible = Not isWelcomeCompany;

            }
        }
        modify("Salesperson Code")
        {

            Caption = 'Provider Code';
            Visible = Not isWelcomeCompany;
        }
        // modify("Contact Name")
        // {
        //     Caption = 'Patient Name';
        // }
        modify("Contact No.")
        {
            // Visible = not isWelcomeCompany;
            // Visible = false;
            // Caption = salespersoncodecaption;
            // Caption = salespersoncodecaption;

            Visible = isWelcomeCompany;
        }

        modify("Contact Name")
        {
            Visible = isWelcomeCompany;
        }
    }
    var
        salespersoncodecaption: Text[1000];

        isWelcomeCompany: Boolean;

    trigger OnOpenPage();
    begin


        salespersoncodecaption := 'A';
        isWelcomeCompany := true;

        if CompanyName() = 'Welcome Center'

        then begin
            isWelcomeCompany := false;
            // Caption := Caption('Patients');
            salespersoncodecaption := 'B';
        end;
    end;

}


pageextension 50109 createinteraction extends "Create Interaction"
{
    layout
    {



        addbefore("Campaign Description")
        {

            field("PatientName"; Rec.PatientName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Patient Name';
                Visible = Not isWelcomeCompany;

            }
            field("PatientPhone"; Rec."Contact Phone No.")

            {

                ApplicationArea = Basic, Suite;
                Caption = 'Patient Phone';
                Visible = Not isWelcomeCompany;
            }
            field("Provider Code"; Rec."Salesperson Code")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Provider Code';
                Visible = Not isWelcomeCompany;

            }
            field("CallInitationTime"; Rec."Time of Interaction")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call Initation Time';
                Visible = Not isWelcomeCompany;

            }


            // field("CallInitiationTime"; Rec."Time of Interaction")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Visible = true;

            // }
            // field("CorrespondenceType"; Rec."Correspondence Type")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Visible = false;

            // field("CallEndTime"; Rec.CallEndTime)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Call End Time';

            // }

            // }
        }


        addafter("CallInitationTime")
        {
            field("CallEndTime"; Rec."CallEndTime")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call End Time';
                Visible = Not isWelcomeCompany;

            }
        }

        modify("Time of Interaction")
        {
            Visible = isWelcomeCompany;
        }
        modify("Cost (LCY)")
        {
            Visible = isWelcomeCompany;
        }
        modify("Duration (Min.)")
        {
            Visible = isWelcomeCompany;
        }
        modify("Correspondence Type")
        {

            Visible = isWelcomeCompany;
        }


        modify("Campaign Response")
        {

            Visible = isWelcomeCompany;
        }
        modify("Campaign Target")
        {

            Visible = isWelcomeCompany;
        }


        modify("Information Flow")
        {

            Visible = isWelcomeCompany;
        }
        modify("Initiated By")
        {

            Visible = isWelcomeCompany;
        }
        modify("Campaign Description")
        {

            Visible = isWelcomeCompany;
        }
        modify("Interaction Successful")
        {

            Visible = isWelcomeCompany;
        }
        modify("Opportunity Description")
        {

            Visible = isWelcomeCompany;
        }
        modify("Evaluation")
        {

            Visible = isWelcomeCompany;
        }

    }
    var
        salespersoncodecaption: Text[1000];

        isWelcomeCompany: Boolean;

    trigger OnOpenPage();
    begin


        salespersoncodecaption := 'A';
        isWelcomeCompany := true;

        if CompanyName() = 'Welcome Center'

        then begin
            isWelcomeCompany := false;
            // Caption := Caption('Patients');
            salespersoncodecaption := 'B';
        end;
    end;
}

tableextension 50144 segmentList extends "Segment Line"
{
    fields
    {
        // field(50020; CallInitationTime;
        // Time)
        // {
        //     Caption = 'Call Initation Time';

        // }
        field(50021; CallEndTime;
        Time)
        {
            Caption = 'Call End Time';

        }
        // field(50022; PatientPhone;
        // Text[12])
        // {
        //     Caption = 'Patient Phone';

        // }

        field(50023; PatientID;
        Text[12])
        {
            Caption = 'Patient ID';
        }


        field(50024; PatientName;
        Text[12])
        {
            AutoFormatType = 1;
            CalcFormula = max(Customer.Name where(Name = field("Contact Name")));
            Caption = 'Patient Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
tableextension 50145 interactionlogs extends "Interaction Log Entry"
{


    fields
    {
        field(50020; CallInitationTime;
        Time)
        {
            Caption = 'Call Initation Time';

        }
        field(50021; CallEndTime;
        Time)
        {
            Caption = 'Call End Time';

        }
        field(50022; PatientPhone;
        Text[12])
        {
            Caption = 'Patient Phone';


        }

        field(50023; PatientID;
        Text[12])
        {
            Caption = 'Patient ID';

        }
        field(50024; PatientName;
        Text[12])
        {
            Caption = 'Patient Name';

        }
    }


}



