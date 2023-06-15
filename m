Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A9731F79
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jun 2023 19:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=KBaAgu/PBxxc76ejCBdDwsyx4h5pSm/5Gjf6PxJ/AVI=; b=idvcEptdrI8dOpGAoBxDo1rcOM
	3HqoZtVMqKsi73Ph2HZsY602ZyUo6IuTUVXtCzdptemMD5bN8sYY4niusqw9gtEuzw4kt4Dvh+O5w
	tfFvHXfw0PdfMx3ZyqnRH/8/qcUJkaG/TPvPt0QVf1m7fq4yDpHlOYTaPIq6CuG5UmNRoBl7f1Jaw
	PtWThW3kLfKRwTqiGarkXMuG8sCtG/i2mgT6eCQAXKJYYGFtkNYdAvBNPOugJrxcWy25j7mcSxxc4
	49yog73vdiuuf0xubE/lrpfGYVlwcvXjQQDRz4fF2WwDVcD0Fq5Y43OuK1vb7Jj3dIyiZeUtB1+ZI
	Z1o4wT2g==;
Received: from ip6-localhost ([::1]:35026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q9r3p-002d3G-DN; Thu, 15 Jun 2023 17:47:05 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q9r3h-002d37-7T
 for samba-technical@lists.samba.org; Thu, 15 Jun 2023 17:47:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-25e8b4181easo857753a91.1
 for <samba-technical@lists.samba.org>; Thu, 15 Jun 2023 10:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1686851214; x=1689443214;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KBaAgu/PBxxc76ejCBdDwsyx4h5pSm/5Gjf6PxJ/AVI=;
 b=PuF6kE87cfebMSWn0Hnba9qo0vdACZ3P29GXCIhHmcJUVee5dx9lcd/1wuSWBSDAEu
 +9xWsjssXwill91nS4Mu+/iedVCqVGbeSbbeReHodYq7tN0C3tSyUaOp7cdhvCoTnqmx
 E4arOF5Fmd3RprsRVSO849xcftIaeJLQafvhkk+djWNNrs8dhuUmmNhppCPPg0uSme01
 xQXSUeFCvy85D3/ZLLX1te/ts66gno35YlhqAjWotzk0x8ijQW9YPxkFHo9hMhsQkSW1
 6KWkGEuV8QeZdF5QL1I6mZPOgfQAFi0wLKCA7LdfB2SPKJEzFomJ5OMsFdSeStdfUh7o
 PwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686851214; x=1689443214;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KBaAgu/PBxxc76ejCBdDwsyx4h5pSm/5Gjf6PxJ/AVI=;
 b=fHsMZJsRTBErxAjrS2wIUIojMCaPJs9JiMM22pG59EH068LRpN4IC2XM0hrQ8SwJM5
 O4A6xvNED91XuPhJ3w6URi7mDhDJ8hIeFFKe+R1aHWKNlFgFc1NjOBRHn3/yq9jit3/g
 6jX/KNljp1fDND3242eoEE3UHJxFwMcz1cGm3RKeV/NgMfFZL1f1q/KVkFBkhWKrJxwT
 HZTnVRS6vuG6wU+jwlWsiNdACjvviTsJJUQG0A3n4ETQalQfZyEpo4tn2kZE/1ISC01W
 L6masivuvVxmBdGTKiJ8er4pRZSUNJ9tVpqW0+ZrRz6Pmu9hyKnl+jQhPIwe2Rd8oQUX
 4GRA==
X-Gm-Message-State: AC+VfDw29F3wYYzmvn+sunmtP64+oPtc7I/cetjcpiHRgVx3ACeQq19q
 O7IGq1nHS+LAfu5prOPY/C8c0wxS+0khYOfkSMVAFaukadeHI5uFVWN9ZA==
X-Google-Smtp-Source: ACHHUZ5LnOcIAy6H2K4sFivmOrPG1QjBMETLORZBz5jVnXq+f8pmImqGoqfqQrCRB7ebOHAyI6BxUq5OOtr6uJrFthE=
X-Received: by 2002:a17:90a:4c81:b0:253:572f:79b2 with SMTP id
 k1-20020a17090a4c8100b00253572f79b2mr4098592pjh.36.1686851213699; Thu, 15 Jun
 2023 10:46:53 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 15 Jun 2023 10:46:41 -0700
Message-ID: <CAB5c7xoEyj7nFM-BdznG9Ysso61yv0fSJ573DZtfkM=0xJwx7Q@mail.gmail.com>
Subject: winbindd recursion in 4.18 for local users
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey all,

When I create a username that contains an upper-case character (and
insert into passdb.tdb), uncached lookups in winbind of name-to-sid
for name that differs in case only basically enters into a recursive
loop until winbind hits command timeout.

username "Bob" + "Bob" -- hit, no loop
username "Bob" + "bob" -- failure / command timeout

```
  [python3 (46157)] Winbind external command LOOKUPNAME start.
  [nss_winbind (45990)] Winbind external command GETPWNAM start.
  [nss_winbind (46000)] Winbind external command GETPWNAM start.
  [nss_winbind (46010)] Winbind external command GETPWNAM start.
  [nss_winbind (46027)] Winbind external command GETPWNAM start.
  [nss_winbind (46039)] Winbind external command GETPWNAM start.
  [nss_winbind (46070)] Winbind external command GETPWNAM start.
  [nss_winbind (46079)] Winbind external command GETPWNAM start.
  [nss_winbind (46135)] Winbind external command GETPWNAM start.
```

NOTE: above is using libwbclient via python, but the same happens with wbinfo.

Basically we go winbind_lookupname_send() -> wb_lookupname() ->
winbind domain child -> forked rpc client (passdb) -> getpwnam
(lower-case "bob") -> nss_winbind -> wb_lookupname-> <repeat>


If I make the following relatively simple change to winbind the
recursion is prevented:
```

root@scalebuilder:/CODE/scale-build/sources/truenas_samba# git diff HEAD
diff --git a/source3/winbindd/wb_lookupname.c b/source3/winbindd/wb_lookupname.c
index 12dbfbef2d..bb39f01a08 100644
--- a/source3/winbindd/wb_lookupname.c
+++ b/source3/winbindd/wb_lookupname.c
@@ -20,6 +20,8 @@
 #include "includes.h"
 #include "winbindd.h"
 #include "librpc/gen_ndr/ndr_winbind_c.h"
+#include "passdb/lookup_sid.h" /* only for LOOKUP flags */
+#include "passdb/machine_sid.h"
 #include "../libcli/security/security.h"

 struct wb_lookupname_state {
@@ -74,6 +76,20 @@ struct tevent_req *wb_lookupname_send(TALLOC_CTX *mem_ctx,
                return tevent_req_post(req, ev);
        }

+       if (flags == (LOOKUP_NAME_NO_NSS | LOOKUP_NAME_REMOTE)) {
+               if (dom_sid_compare_domain(&domain->sid,
+                   get_global_sam_sid()) == 0) {
+                       D_NOTICE("Domain [%s] is our local domain, "
+                                "avoid recursive lookup\n",
+                                dom_name);
+
+                       tevent_req_nterror(req, NT_STATUS_NONE_MAPPED);
+                       return tevent_req_post(req, ev);
+               }
+
+               flags &= ~LOOKUP_NAME_REMOTE;
+       }
+
        subreq = dcerpc_wbint_LookupName_send(
                state, ev, dom_child_handle(domain),
                state->dom_name, state->name,
diff --git a/source3/winbindd/winbindd_getpwnam.c
b/source3/winbindd/winbindd_getpwnam.c
index da162a4b77..f26afb505e 100644
--- a/source3/winbindd/winbindd_getpwnam.c
+++ b/source3/winbindd/winbindd_getpwnam.c
@@ -87,7 +87,7 @@ struct tevent_req *winbindd_getpwnam_send(TALLOC_CTX *mem_ctx,
                                    state->namespace,
                                    state->domname,
                                    state->username,
-                                   LOOKUP_NAME_NO_NSS);
+                                   LOOKUP_NAME_NO_NSS | LOOKUP_NAME_REMOTE);
        if (tevent_req_nomem(subreq, req)) {
                return tevent_req_post(req, ev);
        }
```

The reasoning behind this is that nss_winbind probably shouldn't
bother with trying to return getpwnam results for our local machine
SID. Failure for other NSS modules to provide passwd entry should be
authoritative, and it's better to bail on the request quickly.

Andrew

