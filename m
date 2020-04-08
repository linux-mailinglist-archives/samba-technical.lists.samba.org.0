Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA561A27B5
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 19:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=rb49k+GmFB6lGBk17Lrco/88fJp+yLBDw4VGZEVlsnE=; b=KUYqQ85AfXOncpnEnOAeZS2Nxh
	qMVvvjSGlYJ0cb8eNIch+F+j9crcPw+7/j5s8FC2lXiHeYhUXitoxKv3UrLtH4XwyzcHjUDm63J6p
	doVkts20xmX9z/hpSP3rGMRkmPsZYC3+WojcngOy2DBBiwFPbbGRcKeOhdKUc0xGn/os245cuOI1n
	IhX53zMnUEoXVvNvkG6175EVQII4P1KTamzUdkQH6o8ptFgzgZAVy33QAlZt6j5syFSizVgcLflRW
	KtKVav2PWAFN248a3AVbmk6KUA6VvhLt6Lp+iyPu8uQ8P6X5r9AaeLsnmjvDR3JKgwM8B8eoveitK
	0sr5P07Q==;
Received: from localhost ([::1]:56710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMEBV-000BrY-Eb; Wed, 08 Apr 2020 17:08:17 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53734) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jMEBQ-000BrR-9m
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 17:08:15 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038H4UQr108130
 for <samba-technical@lists.samba.org>; Wed, 8 Apr 2020 13:08:08 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3091ym3pmh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 08 Apr 2020 13:08:07 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Wed, 8 Apr 2020 18:07:52 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Apr 2020 18:07:50 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038H82ZV43122728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 17:08:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA62652050;
 Wed,  8 Apr 2020 17:08:02 +0000 (GMT)
Received: from sig-9-145-186-178.de.ibm.com (unknown [9.145.186.178])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 84A975204E;
 Wed,  8 Apr 2020 17:08:02 +0000 (GMT)
Subject: Re: tldap search paged
To: Jeremy Allison <jra@samba.org>
Date: Wed, 08 Apr 2020 19:07:57 +0200
In-Reply-To: <20200408160707.GA8347@jeremy-acer>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
 <20200408160707.GA8347@jeremy-acer>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-tXEY7Jiby5iwiL/SaUHV"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20040817-0012-0000-0000-000003A0CE5E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040817-0013-0000-0000-000021DDF437
Message-Id: <697ec73e9ff11f54648f4e2519c3316031b53027.camel@linux.ibm.com>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: swen via samba-technical <samba-technical@lists.samba.org>
Reply-To: swen@linux.ibm.com
Cc: Volker Lendecke <vl@samba.org>, uri@samba.org, metze@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-tXEY7Jiby5iwiL/SaUHV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-08 at 09:07 -0700, Jeremy Allison wrote:
> On Wed, Apr 08, 2020 at 08:32:50AM +0200, swen via samba-technical
> wrote:
> > Hi Uri, Jeremy, Ralph, Volker, Metze and others
> >=20
> > I know you all have received enough emails about this subject
> > already,
> > but I'd like to ask you one more time to revisit merge request 1258
> >=20
> > https://gitlab.com/samba-team/samba/-/merge_requests/1258
> >=20
> > I'm not sure if you all got informed about the comments / updates
> > since
> > our last conversation round, therefore, I'm sending out this
> > friendly
> > reminder :-)
> >=20
> > As stated in the MR, I have updated the code according to your
> > comments
> > and suggestions, including an abort mechanism for the async-
> > callback
> > variant.=20
> > ...and yes, for now, I threw out the _all-variant.
> >=20
> > In order to re-start my work on winbindd_ldap, which is the "real"
> > project I'm working on, I need to have a stable foundation in the
> > tldap-area.
> >=20
> > So please, if your time permits, have another look at the MR.
>=20
> You haven't explained *why* you need this code.
Hmm sorry, I thought I did say that I'm in the process of creating a
winbindd_ldap which is supposed to replace winbindd_ads.
>=20
> I see tldap changes, and a test which is great.
>=20
> I don't see any *users* of this code.
>=20
> Adding utility code without any use requirements
> is a receipe for bad API's and design.
The API is there already and wasn't created or changed by me.
In fact, the utility code exists since 2009.

The things I did include:
1. Extend the torture test to actually execute a real world scenario
   ...pretty much what I will do in winbindd_ldap's enum_dom_groups()
2. Externalizing tldap_context's last_msg, which was asked for by Metze
   and adding a torture test for it.
3. Introducing #2 to the existing search_paged function
4. Creating the possibility to abort the async-callback for=20
 =20
search_paged which was asked for by Uri
   ...and creating a test for it.
>=20


> Please show the need for this code before
> we go any further spending valuable review
> time on it.
I was trying to split the review process and my coding efforts
into smaller chunks which should help everyboy to consume and digest
the changes better.
If I only present the end-version, then it could get ugly to change
major parts of it.
Therefore, It thought the early presentation and inclusion of self-
contained code parts would be the smarter way.

Anyhow, here is a code snippet of what is currently part of my new
winbindd_ldap.c which shows how the proposed code changes are used.

static void enum_dom_groups_cb(struct tevent_req *req)
{
        struct dom_groups_res *res =3D
                tevent_req_callback_data(req, struct dom_groups_res);
        struct wb_acct_info *tmp;
        struct tldap_message *msg;
        size_t array_size;
        char *name =3D NULL;
        char *gecos =3D NULL;
        struct dom_sid sid =3D {0};
        uint32_t rid;
        TLDAPRC rc;

        if (!tevent_req_is_in_progress(req)) {
                return;
        }

        rc =3D tldap_search_paged_recv(req, talloc_tos(), &msg);
        if (!TLDAP_RC_IS_SUCCESS(rc)) {
                DBG_ERR("SSS in callback-2 rc=3D%d\n", rc.rc);
                tevent_req_ldap_error(req, TLDAP_PROTOCOL_ERROR);
                return;
        }

        switch (tldap_msg_type(msg)) {
        case TLDAP_RES_SEARCH_ENTRY:
                if (res->num_info >=3D talloc_array_length(res->info)) {
                        array_size =3D res->num_info + res->page_size;
                        if (array_size < res->page_size) {
                                tevent_req_ldap_error(req, TLDAP_PARAM_ERRO=
R);
                                return;
                        }

                        tmp =3D talloc_realloc(req,
                                             res->info,
                                             struct wb_acct_info,
                                             array_size);

                        if (tmp =3D=3D NULL) {
                                tevent_req_ldap_error(req, TLDAP_NO_MEMORY)=
;
                                return;
                        }

                        res->info =3D tmp;
                }

                name =3D tldap_talloc_single_attribute(msg,
                                                     "sAMAccountName",
                                                     req);
                if (name =3D=3D NULL) {
                        DBG_INFO("Object lacks sAMAccountName attribute\n")=
;
                        goto out;
                }

                gecos =3D tldap_talloc_single_attribute(msg, "name", req);
                if (gecos =3D=3D NULL) {
                        DBG_INFO("Object lacks name attribute\n");
                        goto out;
                }

                if (!tldap_pull_binsid(msg, "objectSid", &sid)) {
                        DBG_INFO("No SID found\n");
                        goto out;
                }

                if (!sid_peek_check_rid(res->dom_sid, &sid, &rid)) {
                        DBG_INFO("No rid for %s !?\n", name);
                        goto out;
                }

                res->info[res->num_info].acct_name =3D name;
                res->info[res->num_info].acct_desc =3D gecos;
                res->info[res->num_info].rid =3D rid;
                res->num_info++;

                break;
        default:
                break;
        }

out:
        TALLOC_FREE(msg);
}


static NTSTATUS enum_dom_groups(struct winbindd_domain *domain,
                                TALLOC_CTX *mem_ctx,
                                uint32_t *num_entries,
                                struct wb_acct_info **info)
{
        const char *attrs[] =3D {"sAMAccountName", "objectSid", "name",
                               "userPrincipalName", NULL};
        struct tevent_context *ev;
        struct dom_groups_res *res;
        struct wb_ldap_context *ctx =3D NULL;
        const size_t page_size =3D 1000;
        struct tevent_req *req;
        const char *filter;
        NTSTATUS status =3D NT_STATUS_SUCCESS;
        TLDAPRC ret;

        if (domain =3D=3D NULL || !winbindd_can_contact_domain(domain)) {
                DBG_ERR("No incoming trust for domain %s\n",
                          domain ? domain->name : "NULL");

                /* Tell the cache manager not to remember this one */
                return NT_STATUS_SYNCHRONIZATION_REQUIRED;
        }

        ret =3D wb_ldap_connection(domain);
        if (!TLDAP_RC_IS_SUCCESS(ret)) {
                status =3D NT_STATUS_DOMAIN_CONTROLLER_NOT_FOUND;
                goto out;
        }

        filter =3D talloc_asprintf(mem_ctx, "(&(objectCategory=3Dgroup))");

        ctx =3D talloc_get_type_abort(domain->private_data,
                                    struct wb_ldap_context);


        if (filter =3D=3D NULL) {
                status =3D NT_STATUS_NO_MEMORY;
                goto out;
        }
        ev =3D samba_tevent_context_init(mem_ctx);
        if (ev =3D=3D NULL) {
                DBG_ERR("Failed to create event context\n");
                goto out;
        }

        req =3D tldap_search_paged_send(mem_ctx, ev, ctx->ld, ctx->naming_c=
tx,
                                      TLDAP_SCOPE_SUB, filter,
                                      attrs, 4, 0,
                                      NULL, 0, NULL, 0, 0, 0, 0, page_size)=
;

        if (req =3D=3D NULL) {
                DBG_ERR("Search paged failed.\n");
                goto out;
        }

        res =3D talloc_zero(req, struct dom_groups_res);
        res->page_size =3D page_size;
        res->dom_sid =3D &domain->sid;
        tevent_req_set_callback(req, enum_dom_groups_cb, res);

        tevent_req_poll(req, ev);

        *info =3D res->info;
        *num_entries =3D res->num_info;
out:
        return status;
}





--=-tXEY7Jiby5iwiL/SaUHV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl6OBO0ACgkQug2knLYP
Yas0tQ/5ASKnqXtt8ExX5qnGL9qaIJZJx0QVvP8b2SI91buY2hRhrawGApenjCG1
bgH0vpgQizfTGXK5Ig5YRqgKJNtMRhtVtUlfx5ncUYsOM6/9mVSkcr6ZGwnprGcl
HfZOyVI+MzzWHGUVekR+EMe+8gUBR9HrOfw4n6DKlswJVzAz0Elh08q8CmkWsyIm
AnKAjy4+zJ/wpK5oFw1YfQ2E1etrfZ+b5hUWLqV2NrxzSyzhrv2pgBCnxEWs0kMv
onVBaPxDt/jntOnw84nKv5/Lq+5Y1sHhq3F1/MXZO6ndH3OSsILXgYHfan2SgFk9
FYaKChBKSURGG9dC+NglyD0wmWJ0aHECXBC1rir4h23eWPe9svBQAKj05psUlixJ
4UChvATV5LE/2yvjLiDUznz/EWYwEtA6eVdwwEQV44G7mwMSITR9GcQPhS177aPr
8lEXEECwT21zAjpHnhzt+lqaM65QchggawVT6C+fX1ZBuvIeZy3ZeMA3B0PrsGcU
4oQWnTOxWiP8K6Gduiu7wme5afp5YV1CPiFtkWIkoKN0nfZdS311w/TW+ZrGeJMq
5r+hyrDG0Bx9OvuCzuzkw046DgMK8ZA1f4H90fJB6diXIfM6/93P3jrcdtHdT/jl
WdvWLL8IOv5iFxfZ+x1qXnJNbTwGIPB3Bk/xMRr5BxuN2jN48EY=
=KsHG
-----END PGP SIGNATURE-----

--=-tXEY7Jiby5iwiL/SaUHV--


