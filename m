Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB822BFF9
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2019 09:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Q1WTra0kuFmUxBF7CqihK0PnxyJuNLAkofDSck/Od/I=; b=qie1f0RwONiCdkRtCwxbQ4DoAy
	Og/mT+AmkdmZBBl1PRRzkiz9/WhgYTFUkRFNbW9uFkJgZ87LGIWLGXY4keNtIPwgBIVMpbCu6AoeU
	6L89EtnFbFhDLyFWJFOb9A/ECPs6eG34vImhM7jR+bZ0NvC6CRy20tsCEsoJ1bOan3hJLAidTTrge
	j8sDNUqTrH2sqKZx4AXt7wlTCjE036pbGXTR1FZPiOboh4vEBWfPlbXbSEd39sToc6N+6UND/tKl8
	e+sxr1DJT7h9CAXXPQj911d4PBLfyTgy3TBJRyer8z4u5K+9+XBBnaokHzowMiAfS9hUODwZQRvkL
	nyTuWt3Q==;
Received: from localhost ([::1]:45050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVWMO-002H1M-50; Tue, 28 May 2019 07:17:24 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169]:41063) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVWMG-002H1D-MF
 for samba-technical@lists.samba.org; Tue, 28 May 2019 07:17:19 +0000
Received: by mail-pf1-f169.google.com with SMTP id q17so6059952pfq.8
 for <samba-technical@lists.samba.org>; Tue, 28 May 2019 00:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Q1WTra0kuFmUxBF7CqihK0PnxyJuNLAkofDSck/Od/I=;
 b=e+OWTOeDgN7XxC8ENQiQ5nMs4DSYWucmjngSxvmV+Gjrkrajgyw0CBnFvRiaiVcrKk
 wvzOWJpZrqS/s8uXF+vq+VoUX8M5jggZVzTxIKhqYRL4QQLK2pL2Dvq8GI67Jb/DFX+Q
 0HzzC/HIqkZ/0mDwPb1decG7GfdbPEVyzKTYN7l3uNaJ8PZ9i9chGx/XDuOC0ZO+yEGr
 80hr0xyXmE7Hxhi80sDX+fnulcNpvr9LpiZKWW6lItVPfyyAB8TVKmBu+qtlY3BItDsX
 JXAgPQ47MOaTpN9AQdyE1bP2Nug5VRdtjSNFAPBMDfXExgHNB2IOI7w2vJu7yjmAfo76
 GmlQ==
X-Gm-Message-State: APjAAAXdgTof4B0bPsnm0PHo3igY9Cjus9KNk7Um0VCC0dYiyTyp7nbd
 K1JRxzrympIBJ6l5FbIUPjWY8WUnTw0=
X-Google-Smtp-Source: APXvYqy8mkI0IHy8Il0Rtr40YLwP+V776C4zVrKVBDr03xVlYv0xxj54rFspfirBDe1fbmIBMtaRQw==
X-Received: by 2002:a17:90a:cd03:: with SMTP id
 d3mr3480933pju.127.1559027832128; 
 Tue, 28 May 2019 00:17:12 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id e6sm19093637pfl.115.2019.05.28.00.17.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 00:17:08 -0700 (PDT)
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: Ralph Boehme <slow@samba.org>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
Message-ID: <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
Date: Tue, 28 May 2019 12:47:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190527140812.qeyamc5kzomgipuj@inti>
Content-Type: multipart/mixed; boundary="------------F4FF3E3753ED28E649370522"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------F4FF3E3753ED28E649370522
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello slow,

Created merge request:
https://gitlab.com/amitkuma/samba/commit/1a6f331445364de623d02425c8d8b46a59eb2c53

Attached patch as well.
(0001-s3-winbind-Not-abort-when-received-NULL-SID.patch)

Thanks


On 05/27/2019 07:38 PM, Ralph Boehme wrote:
> On Mon, May 27, 2019 at 05:05:54PM +0530, Amit Kumar via
> samba-technical wrote:
>> Created patch using following command set:
>> # git clone https://github.com/samba-team/samba
>> # cd samba
>> Done changes
>> # # git checkout -b null-sid
>> M    source3/winbindd/winbindd_rpc.c
>> Switched to a new branch 'null-sid'
>> # git add source3/winbindd/winbindd_rpc.c
>> # git commit -m "winbind null sid handling"
>> # git format-patch -1 HEAD
>> 0001-winbind-null-sid-handling.patch
>
> hm, still fail:
>
> slow@inti:autobuild ▸ git log --oneline -1 HEAD
> 412afb2aef1 (HEAD -> ab, origin/master, gitlab/master) Fix ubsan null
> pointer passed as argument 2
>
> slow@inti:autobuild ▸ git am
> ~/patches/0001-winbind-null-sid-handling.patch
> Applying: winbind null sid handling
> error: patch failed: source3/winbindd/winbindd_rpc.c:958
> error: source3/winbindd/winbindd_rpc.c: patch does not apply
> Patch failed at 0001 winbind null sid handling
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> Can you check?
>
> While at it, can you please add a bit more desciptive text to the
> commit message describing the problem and the fix? Thanks!
>
> Finally please also add your signed-off by once you're happy with the
> state of your patch:
>
> https://wiki.samba.org/index.php/CodeReview#commit_message_tags
>
> Thanks!
> -slow
>


--------------F4FF3E3753ED28E649370522
Content-Type: text/x-patch;
 name="0001-s3-winbind-Not-abort-when-received-NULL-SID.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-s3-winbind-Not-abort-when-received-NULL-SID.patch"

From 1a6f331445364de623d02425c8d8b46a59eb2c53 Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Tue, 28 May 2019 22:54:55 +0530
Subject: [PATCH] s3: winbind: Not abort when received NULL SID

Source code in winbind_rpc.c states that if the trusted domain has no SID, winbindd just aborts the session. This happens with MIT Kerberos realm added as trust to AD and winbindd just returns without processing further as there is no SID returned for the Linux system having kerberos support.

This fix makes winbindd to process non NULL trusted domain SIDs instead of aborting the request. winbind will leave out sid that is not received.

Signed-off-by: Amit Kumar <amitkuma@redhat.com>
---
 source3/winbindd/winbindd_rpc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/source3/winbindd/winbindd_rpc.c b/source3/winbindd/winbindd_rpc.c
index ffbaabcfe49..84f6bcfd381 100644
--- a/source3/winbindd/winbindd_rpc.c
+++ b/source3/winbindd/winbindd_rpc.c
@@ -958,24 +958,26 @@ NTSTATUS rpc_trusted_domains(TALLOC_CTX *mem_ctx,
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
+                       if (sid != NULL) {
+                               trust->sid = sid;
+                       } else {
+                               trust->sid = NULL;
+                       }
                }
        } while (NT_STATUS_EQUAL(result, STATUS_MORE_ENTRIES));

-- 
2.17.1

--------------F4FF3E3753ED28E649370522--

