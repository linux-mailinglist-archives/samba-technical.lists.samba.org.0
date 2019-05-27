Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B986B2AFC1
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 10:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=62xw6q0+tPoeC98fT+3dlK8+6JLcZ0I1A1tfFEBY/dQ=; b=rbTaHUYBusZUZTe0AzVRehc1Hd
	WO5LVlhxaigMzTl2oiFfmJ1+zB12jtfFuDtBwTF0spNj/7CwdnHgbG3FKhxpatNfDGDm1Alg8XIHV
	LeAEgm0uA/iua3Tbg3D4yOSDxKU0blD4G5VZdSS7uHBxyRmnvt9iPwnoNABDmK3RXNF2SpM+KwH9f
	HEQEbe8WFAxsw26uL+0Vhk6HUkdwVDJxosd52P4TvjKWoPDFQrKXokcOfIjxNF9UufqoPdnKOEq0R
	pnOhy4bzttS982pTeacELOVLhij2eZ8lImRt+SoOdFOLgt+mKSi+jNXvzUMT6ItEkwPg5F44QGvvm
	/jmqmS1w==;
Received: from localhost ([::1]:43338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVAfc-0027rM-V8; Mon, 27 May 2019 08:07:49 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180]:37988) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVAfX-0027rD-Tr
 for samba-technical@lists.samba.org; Mon, 27 May 2019 08:07:46 +0000
Received: by mail-pg1-f180.google.com with SMTP id v11so8669746pgl.5
 for <samba-technical@lists.samba.org>; Mon, 27 May 2019 01:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=62xw6q0+tPoeC98fT+3dlK8+6JLcZ0I1A1tfFEBY/dQ=;
 b=Oh5UbNtGuipIPzRxJ7MovXZk6IoKv74umXyfUfpKrl8nLQ4Q/jf+Etbc62nuPmLIA1
 NLsMy0Drp7FYK2xtW9O7dtzr9vl2LIWreDvPLErVFCKwZ8MQvoRAS+kbrG5ILOsq1ziE
 oCv0l/EB8w6BwK6sjPzmlsEIgh0/kooFoER7DukLqGQsf+KGRTKI7K9aKeHE+JrzyUQ9
 ZQVkD0Vz1yVqXJDmlzR9Tar061ZgrBQLYA6GoAGr+TCdhelc5Q7Gxqpzu8c0bJOkU8vb
 Ydwja7IKb+r5tK71Emw5FbCnPBCzHES82AnfyXlP1vpjVn5yYzcT0PmKshxKqphgl8c7
 kB+w==
X-Gm-Message-State: APjAAAVOgxyq83yUnJCF9HzObUlOjMGZEzGUd8Si2ot3OBkqjIt91078
 M/c5OylZ8CU7KzO/dKiI5JcF4Kos/iY=
X-Google-Smtp-Source: APXvYqwU2KM/phXaFcZNHUFCGqIUL9eUoSMqZcDqzFz27A1CruQUETFRb/M4zGk0IcGDeNpfZVHKcQ==
X-Received: by 2002:a65:5003:: with SMTP id f3mr122569235pgo.336.1558944461189; 
 Mon, 27 May 2019 01:07:41 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id s66sm27670155pfb.37.2019.05.27.01.07.39
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 01:07:40 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH]: winbind handling NULL sids (bug #13914)
Message-ID: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
Date: Mon, 27 May 2019 13:37:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------33F5EB659B717F3958280D1E"
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------33F5EB659B717F3958280D1E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



--------------33F5EB659B717F3958280D1E
Content-Type: text/x-patch;
 name="001-winbind-null-sid-handling.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="001-winbind-null-sid-handling.patch"

winbind should not abort on receiving NULL sid.

Presently if the trusted domain has no SID, winbindd just aborts the session. This happens with MIT Kerberos realm added as trust to AD.
This code change will make winbind skip NULL sid instead of aborting the request, winbind will process the remaining trusted domain SIDs.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13914

Signed-off-by: Amit Kumar <amitkuma@redhat.com>

diff -up samba-4.10.4/source3/winbindd/winbindd_rpc.c.amit_patch samba-4.10.4/source3/winbindd/winbindd_rpc.c
--- samba-4.10.4/source3/winbindd/winbindd_rpc.c.amit_patch     2019-05-28 01:27:23.223946791 +0530
+++ samba-4.10.4/source3/winbindd/winbindd_rpc.c        2019-05-28 01:30:00.375826959 +0530
@@ -958,24 +958,25 @@ NTSTATUS rpc_trusted_domains(TALLOC_CTX
                                trust->dns_name = talloc_move(array,
                                                              &dom_list_ex.domains[i].domain_name.string);
                                if (dom_list_ex.domains[i].sid == NULL) {
-                                       DEBUG(0, ("Trusted Domain %s has no SID, aborting!\n", trust->dns_name));
-                                       return NT_STATUS_INVALID_NETWORK_RESPONSE;
+                                       DEBUG(0, ("Trusted Domain %s has no SID!\n", trust->dns_name));
+                               } else {
+                                       sid_copy(sid, dom_list_ex.domains[i].sid);
                                }
-                               sid_copy(sid, dom_list_ex.domains[i].sid);
                        } else {
                                trust->netbios_name = talloc_move(array,
                                                                  &dom_list.domains[i].name.string);
                                trust->dns_name = NULL;

                                if (dom_list.domains[i].sid == NULL) {
-                                       DEBUG(0, ("Trusted Domain %s has no SID, aborting!\n", trust->netbios_name));
-                                       return NT_STATUS_INVALID_NETWORK_RESPONSE;
+                                       DEBUG(0, ("Trusted Domain %s has no SID!\n", trust->netbios_name));
+                               } else {
+                                       sid_copy(sid, dom_list.domains[i].sid);
                                }
-
-                               sid_copy(sid, dom_list.domains[i].sid);
                        }
-
-                       trust->sid = sid;
+                       if(sid != NULL)
+                               trust->sid = sid;
+                       else
+                               trust->sid = NULL;
                }
        } while (NT_STATUS_EQUAL(result, STATUS_MORE_ENTRIES));


--------------33F5EB659B717F3958280D1E--

