Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2460732DFC
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 12:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=8cWaLzEaHEjQDzTe96BWqk1CblPG2+uyf0UYyvni+Co=; b=gzPBdJqPY2V2C15FlKTbJwAunx
	MQYKHPQp++e/OnLPSaqhl2t9T4AaUbbFtkLmaiyf3fdUbtuxsUOD2gYxW4lRxG3dRlN22yI1cH+NT
	GMsmy6Yb20gduoH52vc7iITAavW1ZYpFUaKfcCuYs1xi2ednO+8uvKXmhxNrNPf845UIK8abVbsvD
	n9de09PkhWxNqEBtSSEeVI4jPiLv49+MO8+4jJ5O0EcW6HWjcjLZlSk95wOLF48no4gsbL6r8jbVU
	G2yFpW4IOuRPTyhkUviuRPt9mZwUO/AO7GLEDQfWoo05XPRpkfhAYBr7O+FylvvjigmEkLWunybtJ
	e6kXUkig==;
Received: from localhost ([::1]:36634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXkXq-004mnU-G0; Mon, 03 Jun 2019 10:50:26 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174]:33871) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXkXl-004mmc-Cg
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 10:50:24 +0000
Received: by mail-pg1-f174.google.com with SMTP id h2so4826248pgg.1
 for <samba-technical@lists.samba.org>; Mon, 03 Jun 2019 03:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=8cWaLzEaHEjQDzTe96BWqk1CblPG2+uyf0UYyvni+Co=;
 b=G/EfABSrW2gLMVSBXTDbUTBi7E7dSw4gCMUHlq/2DovIT+eaUAWWBWd1cHJQOxZqR1
 k7R3qo7m6UTamXzMFjInk6/t1qTGMd1Ckntf5AHQoUyU4xhZbnRPcWMv+kxXSlss0Q83
 zXv5J7W6kbkXJeyxubxsHikr33P2t6ucSlvxBWIGcEkqAPkyeiIvorwQGoDpgIPrzmtN
 qagcCZU1NZioh+I4ogoDlLKK5L7zBn6QpGw34XPO3B5qy4Fd8taCreRACk+NO3Wf+i7O
 GE2LXsQaUolDwHByzMi5SFGEsDfLZz9C+KaKJjiN96gyHtBgjQoASKmUraUVogc/APbS
 XX6Q==
X-Gm-Message-State: APjAAAUpIZlMRT4mjAPpIHDa/zUS2FjoYhCUaErkXsSTdhO6sRc4rhVK
 2Cxrf00kZTe+jJOwSqYKknP/dXUDyws=
X-Google-Smtp-Source: APXvYqwzlIEz+sYUqF/N/oFMoKLj7Ih1i1EDm1Oz0XJottquazX/aGoURDWZLTW6nJUlG43PZBjkGw==
X-Received: by 2002:a62:1b85:: with SMTP id
 b127mr30217162pfb.165.1559559018954; 
 Mon, 03 Jun 2019 03:50:18 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id m101sm29880601pjb.2.2019.06.03.03.50.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 03:50:17 -0700 (PDT)
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: Ralph Boehme <slow@samba.org>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
 <20190528095640.fcn2gm5gb62qoqel@inti>
 <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
 <cfa5b581-096d-7b08-24e5-010009fda94e@redhat.com>
 <2e4a105b-9ca1-0c1e-d890-a1c1c61c799a@redhat.com>
 <20190531153640.baezcpth3t4l7qmy@inti>
Message-ID: <d5c9dc06-7535-77c3-148b-27d242638ed7@redhat.com>
Date: Mon, 3 Jun 2019 16:20:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190531153640.baezcpth3t4l7qmy@inti>
Content-Type: multipart/mixed; boundary="------------9B5DFFBED96A5C0CCEA25C36"
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------9B5DFFBED96A5C0CCEA25C36
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 05/31/2019 09:06 PM, Ralph Boehme wrote:
> On Fri, May 31, 2019 at 06:53:42PM +0530, Amit Kumar wrote:
>> Hey slow/metze,
>>
>> https://gitlab.com/samba-team/samba/merge_requests/515
>>
>> Pipeline again failed.. cannot understand why!! can you try
>> understand why?
>
> we have a bunch of flapping test, you can try restarting the failed job.
>
> -slow
>


--------------9B5DFFBED96A5C0CCEA25C36
Content-Type: text/x-patch;
 name="0001-s3-winbind-Not-abort-when-received-NULL-SID.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-s3-winbind-Not-abort-when-received-NULL-SID.patch"

From d14bda62b06794760e9ece57420a6b53b24501b3 Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Fri, 31 May 2019 18:57:52 +0530
Subject: [PATCH] s3: winbind: Not abort when received NULL SID

Source code in winbind_rpc.c states that if the trusted domain
has no SID, winbindd just aborts the session. This happens with
MIT Kerberos realm added as trust to AD and winbindd just returns
without processing further as there is no SID returned for the
Linux system having kerberos support.

This fix makes winbindd to skip the domain having NULL SID instead
of aborting the request completely.

Fixes: https://bugzilla.samba.org/show_bug.cgi?id=13914

Signed-off-by: Amit Kumar <amitkuma@redhat.com>
---
 source3/winbindd/winbindd_rpc.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/source3/winbindd/winbindd_rpc.c b/source3/winbindd/winbindd_rpc.c
index ffbaabcfe49..ee997d064ce 100644
--- a/source3/winbindd/winbindd_rpc.c
+++ b/source3/winbindd/winbindd_rpc.c
@@ -952,26 +952,22 @@ NTSTATUS rpc_trusted_domains(TALLOC_CTX *mem_ctx,
                                return NT_STATUS_NO_MEMORY;
                        }

+                        if (dom_list_ex.domains[i].sid == NULL) {
+                               DEBUG(0, ("Trusted Domain %s has no SID, skipping!\n", trust->dns_name));
+                                continue;
+                        }
+
                        if (has_ex) {
                                trust->netbios_name = talloc_move(array,
                                                                  &dom_list_ex.domains[i].netbios_name.string);
                                trust->dns_name = talloc_move(array,
                                                              &dom_list_ex.domains[i].domain_name.string);
-                               if (dom_list_ex.domains[i].sid == NULL) {
-                                       DEBUG(0, ("Trusted Domain %s has no SID, aborting!\n", trust->dns_name));
-                                       return NT_STATUS_INVALID_NETWORK_RESPONSE;
-                               }
                                sid_copy(sid, dom_list_ex.domains[i].sid);
                        } else {
                                trust->netbios_name = talloc_move(array,
                                                                  &dom_list.domains[i].name.string);
                                trust->dns_name = NULL;

-                               if (dom_list.domains[i].sid == NULL) {
-                                       DEBUG(0, ("Trusted Domain %s has no SID, aborting!\n", trust->netbios_name));
-                                       return NT_STATUS_INVALID_NETWORK_RESPONSE;
-                               }
-
                                sid_copy(sid, dom_list.domains[i].sid);
                        }

-- 
2.17.1

--------------9B5DFFBED96A5C0CCEA25C36--

