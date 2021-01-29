Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB3308EF6
	for <lists+samba-technical@lfdr.de>; Fri, 29 Jan 2021 22:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RXSTGXK8czehXr+S/Y+Uu/V2+XMrlPvtpPi2Y+oVFng=; b=p0xu9/YTnw/rHWtN8U67cYgHab
	CfMp8231Aqqf+YkZsVuPuQ9p5XK5YXJgssRJKGkx57T2t0pAiOFtLnUD2VBW+i/wmHIv1sZydNyd6
	WvjvWH3qxNPf7TaIOtUNk+aZpKCNlXOXZVhWvP5I8c4xzxkVkIofh76UrL1H/OBp853o0HpAn8lkl
	oO9Q463eMNJEMOBe5gdS0i8b6OWnfNxphnX2p9bBa4ufzAKnJThaRuP3UXPTyzh+jAbvzV4I+qLkh
	zw2wuOT4zHsRz5qz/ZIT7wHbDvxP/cEWCUgBTcSf2ehEUYJ376Qe4K26/RHWcHbq7w6TNR6afVbG1
	VHfpAInw==;
Received: from ip6-localhost ([::1]:23388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5axJ-007scu-25; Fri, 29 Jan 2021 21:05:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37032) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5axC-007scn-Ul
 for samba-technical@lists.samba.org; Fri, 29 Jan 2021 21:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RXSTGXK8czehXr+S/Y+Uu/V2+XMrlPvtpPi2Y+oVFng=; b=P56RHr3tvHfegzrFhSoJ07TapZ
 f+bAvcHnOPNyhKcwTMG8xoVZjA89Hsv0HGXnSSsNWkws9vvcQ4iQ1EYAsA0CfDo7zqTRVLjVJira4
 VANii0tamWV8Nxp6i6lIcwJd/NXTBg/gmOfbr15A95DGNyFmrUOzLMVbV3iENPVL74enp+1S62x80
 p6rkGCxi+CwdqEanKiFSRoap46/iSMFKSYV/ZIqt9JGaiCi0w5me8CdmVDex4Er1zILlsc8IuXaJf
 DM3+8eDVeI/m9qxX/wRmEBeoK/7pGL/b3JKWK73zAwep2VcUSTCOpWpdagIjIxgRD+IY9E0Yl16G8
 K0KhMGlsDDlmzbPvppZmH1vh8Owiz64RLzx6brPMTme73tcv0GNsGPXPsjLcj5WE9M9bIxiRM5hQJ
 oAZJiuvvz5Et+HRLxnUBZ1QbNX0wRT0ZdMQVJWXBxXNahxoV+FCeBAq+qFazjipW+3l7jlnVYzDNM
 LK56K6p6SFfBKbeR1r07ajcB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5ax9-00082v-Dv; Fri, 29 Jan 2021 21:05:16 +0000
Date: Fri, 29 Jan 2021 13:05:11 -0800
To: Shilpa K <shilpa.krishnareddy@gmail.com>
Subject: Re: winbind cache issue for NDR entries
Message-ID: <20210129210511.GA50742@jeremy-acer>
References: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Jan 29, 2021 at 07:39:40PM +0530, Shilpa K via samba-technical wrote:
>Hello,
>
>We had a customer report that the users were not able to login for about
>30minutes and the problem cleared itself in almost about 30minutes. They
>are using Samba as a member server in a domain which has 2 way trust with
>another domain (say ABC.COM). Upon investigation, we found that there was a
>problem with trusted domain DCs for a very short duration as per the event
>log on the DC of the primary domain. This problem seems to have been
>cleared away after a short duration. Around the same time, a user belonging
>to a trusted domain mapped Samba share and encountered a problem. At this
>time, looks like NDR cache entry for trusted domain group "Domain Users"
>was added in winbindd_cache.tdb to indicate that there was a lookup problem
>and the status NT_STATUS_TRUSTED_DOMAIN_FAILURE was stored as part of this
>entry. Once the issue with trusted domain DC was cleared and the domain was
>back online, when users tried to login, PAM_AUTH was successful for the
>users but getpwnam failed while looking up SID for "Domain Users". This
>failure was returned from the entry in the winbindd_cache.tdb as
>wcache_fetch_ndr() succeeded for this entry. Due to this, users belonging
>to the trusted domain were not able to login. Once the cache was expired,
>getpwnam succeeded for trusted domain users and the shares could be mapped.
>In order to resolve this issue, should we not refresh the sequence number
>when the domain goes online? Btw, we are using "winbind cache time = 1800".

Yep, looks like we should add a call to force a refresh of the
sequence number in the cache here:

source3/winbindd/winbindd_cm.c:set_domain_online()

  538 
  539         domain->online = True;
  540 

Add a force_refresh_domain_sequence_number(domain) call above.

Here is a (raw, untested) patch that implements this.

Any chance you can test this for me ?

Jeremy.

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=wb-hack

diff --git a/source3/winbindd/winbindd_cache.c b/source3/winbindd/winbindd_cache.c
index 201bb34b98a..c8c10aed094 100644
--- a/source3/winbindd/winbindd_cache.c
+++ b/source3/winbindd/winbindd_cache.c
@@ -517,6 +517,41 @@ static bool store_cache_seqnum( struct winbindd_domain *domain )
 				   domain->last_seq_check);
 }
 
+void force_refresh_domain_sequence_number(struct winbindd_domain *domain)
+{
+	NTSTATUS status;
+
+	if (winbindd_can_contact_domain(domain)) {
+		status = domain->backend->sequence_number(domain,
+						  &domain->sequence_number);
+	} else {
+		/* just use the current time */
+		status = NT_STATUS_OK;
+		domain->sequence_number = time(NULL);
+	}
+
+	/* the above call could have set our domain->backend to NULL when
+	 * coming from offline to online mode, make sure to reinitialize the
+	 * backend - Guenther */
+	get_cache(domain);
+
+	if (!NT_STATUS_IS_OK(status)) {
+		DBG_DEBUG("failed with %s\n", nt_errstr(status));
+		domain->sequence_number = DOM_SEQUENCE_NONE;
+	}
+
+	domain->last_status = status;
+	domain->last_seq_check = time(NULL);
+
+	/* save the new sequence number in the cache */
+	store_cache_seqnum(domain);
+
+	DBG_DEBUG("%s seq number is now %"PRIu32"\n",
+		   domain->name, domain->sequence_number);
+
+	return;
+}
+
 /*
   refresh the domain sequence number on timeout.
 */
@@ -561,39 +596,11 @@ static void refresh_sequence_number(struct winbindd_domain *domain)
 		goto done;
 	}
 
-	/* important! make sure that we know if this is a native 
-	   mode domain or not.  And that we can contact it. */
-
-	if ( winbindd_can_contact_domain( domain ) ) {		
-		status = domain->backend->sequence_number(domain, 
-							  &domain->sequence_number);
-	} else {
-		/* just use the current time */
-		status = NT_STATUS_OK;
-		domain->sequence_number = time(NULL);
-	}
-
-
-	/* the above call could have set our domain->backend to NULL when
-	 * coming from offline to online mode, make sure to reinitialize the
-	 * backend - Guenther */
-	get_cache( domain );
-
-	if (!NT_STATUS_IS_OK(status)) {
-		DEBUG(10,("refresh_sequence_number: failed with %s\n", nt_errstr(status)));
-		domain->sequence_number = DOM_SEQUENCE_NONE;
-	}
-
-	domain->last_status = status;
-	domain->last_seq_check = time(NULL);
-
-	/* save the new sequence number in the cache */
-	store_cache_seqnum( domain );
+	force_refresh_domain_sequence_number(domain);
 
 done:
-	DEBUG(10, ("refresh_sequence_number: %s seq number is now %d\n", 
-		   domain->name, domain->sequence_number));
-
+	DBG_DEBUG("%s seq number is now %"PRIu32"\n",
+		   domain->name, domain->sequence_number);
 	return;
 }
 
diff --git a/source3/winbindd/winbindd_cm.c b/source3/winbindd/winbindd_cm.c
index 2029e4e8315..b1fe4102253 100644
--- a/source3/winbindd/winbindd_cm.c
+++ b/source3/winbindd/winbindd_cm.c
@@ -537,6 +537,7 @@ static void set_domain_online(struct winbindd_domain *domain)
 			     MSG_WINBIND_FAILED_TO_GO_ONLINE, NULL);
 
 	domain->online = True;
+	force_refresh_domain_sequence_number(domain);
 
 	/* Send a message to the parent that the domain is online. */
 	if (parent_pid > 1 && !domain->internal) {
diff --git a/source3/winbindd/winbindd_proto.h b/source3/winbindd/winbindd_proto.h
index 8923bb3124f..dc2dd130be8 100644
--- a/source3/winbindd/winbindd_proto.h
+++ b/source3/winbindd/winbindd_proto.h
@@ -53,6 +53,7 @@ NTSTATUS rpc_lookup_sids(TALLOC_CTX *mem_ctx,
 
 /* The following definitions come from winbindd/winbindd_cache.c  */
 
+void force_refresh_domain_sequence_number(struct winbindd_domain *domain);
 NTSTATUS wb_cache_query_user_list(struct winbindd_domain *domain,
 				  TALLOC_CTX *mem_ctx,
 				  uint32_t **prids);

--FCuugMFkClbJLl1L--

