Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91B2B34D
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 13:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=88DMiFwKkjwu7Bq9Jk15ELEs8cXOQBbxpe5fw6Cuvyw=; b=iuWGHybUyYajIKH62y0YoaOHec
	53VQ6ivbpdjNcUOoQEuYZu85jrwXYUrPH8jpzYreWMtV02t2gBgXs/QGndJdLGOpNSTRGAvVNJre4
	0rrNPmis/dDMojEmA6jh35GplOz/VZ5f9uRPfDGTRlkSJ7ww+rsKriX8TiLhSn36sO3Akso7iOiYW
	sp/LQLhP260EEbff062Yo1UxF/q8UbeRtLl0Bg32l8oDAIbEaR7U7yVoGdPbRTWmH0p665XXLnP9m
	nxHn4dploA9b0jS/s2UlyGmJVueu89yY7nTOSEDiAARU8KJQUCj6dMtgtEgK9b9vPvbqhxMyQ830o
	LY3nFWeQ==;
Received: from localhost ([::1]:55882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVDvB-002A8a-Kt; Mon, 27 May 2019 11:36:05 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180]:43500) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVDv6-002A8T-Ha
 for samba-technical@lists.samba.org; Mon, 27 May 2019 11:36:03 +0000
Received: by mail-pl1-f180.google.com with SMTP id gn7so6940465plb.10
 for <samba-technical@lists.samba.org>; Mon, 27 May 2019 04:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=88DMiFwKkjwu7Bq9Jk15ELEs8cXOQBbxpe5fw6Cuvyw=;
 b=WzRjtlqOpoqBVDDCfcghaGPo2JybnmQdCQTwnFrkPPgQNCMk8qAYK+emEmIazE4gTq
 B6ur5WdMWibnn8CEUFgNOxWWyLg/Gk8NRBS9TZ622JFr/Y3+TLdgkKZItHT9IzsygnwO
 81lpXZi67nACgzdaH611yVPo7GytUTL7Vs1kRxngl70b2W6Ivcfn9eW6DC8OTk0Uu263
 jYHYUY7f8oHyZ9tVEtB8QSPUn6LRAuKENl/JR7TTpeFxJ7t3VqE/GKXHlcMVXeteqEGj
 Syy+ZLjmQzAb0hF+g8dSOJtT8ZMWl2GL4bcv9V5/RqWNwUtQZs+sQNKwNTvrbMm59VAf
 9zgA==
X-Gm-Message-State: APjAAAXSF9r6me+o40vA4x+lPrJvLp2iGQew2CylGjUxs2NgoYun9Yoe
 gwsYbAm760dcCCF5nla1tZsDkS0s7sM=
X-Google-Smtp-Source: APXvYqwZfdd2vUjLAh9ENgXbTkwP7dKJgWFYVwst8VeGxHO6a68+1jGIjPMOJQ7KFT4l4p6pKAAfSQ==
X-Received: by 2002:a17:902:a613:: with SMTP id
 u19mr112999435plq.42.1558956957932; 
 Mon, 27 May 2019 04:35:57 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id a30sm16227601pje.4.2019.05.27.04.35.56
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 04:35:56 -0700 (PDT)
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: samba-technical@lists.samba.org
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
Message-ID: <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
Date: Mon, 27 May 2019 17:05:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
Content-Type: multipart/mixed; boundary="------------A3D1ED351121FCC119415C10"
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
--------------A3D1ED351121FCC119415C10
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hey Slow,

Created patch using following command set:
# git clone https://github.com/samba-team/samba
# cd samba
Done changes
# # git checkout -b null-sid
M    source3/winbindd/winbindd_rpc.c
Switched to a new branch 'null-sid'
# git add source3/winbindd/winbindd_rpc.c
# git commit -m "winbind null sid handling"
# git format-patch -1 HEAD
0001-winbind-null-sid-handling.patch

Thanks
Amit

On 05/27/2019 02:29 PM, Ralph Boehme via samba-technical wrote:
> Hi Amit,
>
> thanks for the patch.
>
> Looks like it doesn't apply to master. Can you please also submit it as
> a git format-patch patch instead of a diff?
>
> Thanks!
> -slow


--------------A3D1ED351121FCC119415C10
Content-Type: text/x-patch;
 name="0001-winbind-null-sid-handling.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-winbind-null-sid-handling.patch"

From 05100b0dc8bd244fa8e85f405105e10faaff51a9 Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Tue, 28 May 2019 05:10:17 +0530
Subject: [PATCH] winbind null sid handling

---
 source3/winbindd/winbindd_rpc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/source3/winbindd/winbindd_rpc.c b/source3/winbindd/winbindd_rpc.c
index ffbaabcfe49..ef70995ad03 100644
--- a/source3/winbindd/winbindd_rpc.c
+++ b/source3/winbindd/winbindd_rpc.c
@@ -958,24 +958,25 @@ NTSTATUS rpc_trusted_domains(TALLOC_CTX *mem_ctx,
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

-- 
2.17.1

--------------A3D1ED351121FCC119415C10--

