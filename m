Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4F30918A
	for <lists+samba-technical@lfdr.de>; Sat, 30 Jan 2021 03:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nDUxA/6PHxEFlmFa9amRKsxOMGyGZNQSc7GZpZpshog=; b=qiJdIYvEHSkxS2Vl3/psuOPPlL
	ufpxIgupvYhp7LffyWWHYivisEvezMa919BNcaSVsqt7mcchGYKfb9ltb8DY0KpoE1pVagaOSmNQH
	oOtyLEEXs1e6sTDTMaF6F4+jleEo3JK+2vCCRlTV70MKoRhqsp3CDYA0hTbmsaS2tEokjLKiK2RnQ
	PRTIUullPQbfeYOFQoX/gGs3F/7V9LqGI89TbqronR93q1tGnIzGmEnY2SCSsul1m/v8Y6wmjoX5M
	asnsEz8CBJ79fxkG3bKtLHapyn4kIOH5vVtuX4lP8ss1yjhv6nYN+AOPJ3xo7cHy71V7G0y6uNXQa
	oNU+Yayw==;
Received: from ip6-localhost ([::1]:24202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5gAL-007tYB-Ev; Sat, 30 Jan 2021 02:39:13 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:40631) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5gAF-007tY4-LL
 for samba-technical@lists.samba.org; Sat, 30 Jan 2021 02:39:10 +0000
Received: by mail-ua1-x92f.google.com with SMTP id t43so3856487uad.7
 for <samba-technical@lists.samba.org>; Fri, 29 Jan 2021 18:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXpkqWIs41JasXfcaOwiVFZMr366cLNXr6cV/LsL46M=;
 b=r8cJBf4UlfloH1G+73/ZJ8gbb8hbHTauysBpUwXebGg33m+p0ng6wv59917FiaOn81
 6PCYCaELsatVk/ywxiC01aAjxifN+UDIZNGI/50IefuIC0waefnb/lpTud8xCketES5j
 +97JDH3ZqQ0Ezdb9co/ATEgrZq4PLMGJKp0UmjARAcR9Uf8UrMd6XYWKFaImyVy/HwCg
 RGyo+q886f4vAgVRLVvIOkp/J5rqbNN7BL3cFE19WZYNcxo3aFY6h8W58bVIXNvVamB0
 O9EHlgNTIUxd7/RIBHrvrY1nFg8OIivMZ1sToQDFGvUzaZD/OJ7ikYahsfuxBh32D4TI
 SxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXpkqWIs41JasXfcaOwiVFZMr366cLNXr6cV/LsL46M=;
 b=TdF6GHflL/FmT0hbRAM7FuyjEO/YW/HYKejregLrcIx+vvOwWWRQBx3xIlK8BkcqP+
 ux3JqBzCnUdPtON83MliPXCLgpa4i72oIyNO9hp1XTiwDyxo4oGvK7rF0qVUr5jhXNrZ
 VhkQersWswv7eaFRW1/WlOXaMY8jCm9FY3L//5HdEBejoC/8Q8fmq41scQiwIaviye8D
 scUayasrOba0Y/XzpyjZE/mAsFpqlrup0zAbq8Bm/ARdLShnkxX9u/5soU9FQjwJKf33
 dJUTngKbnSmZwkoJUpVr6wyp7j79UMDa23wihm4uJ0xiAFQuFMIN9cjRQTJGkAI4Ao0n
 zECw==
X-Gm-Message-State: AOAM5332TYRcLtIaE1pv0IPReVQxsSlylO6m/hgJhvRAJAjf22qJw8bM
 o2LO3AxA7W7qPClTcTzauV/mcCCP6BoBJvEpbwudMIj11yqjmA==
X-Google-Smtp-Source: ABdhPJxCMRcn9nIE2zchDfZDSD+a4eRVnMJo4UbPWDuW8hhNQEDnwEC/gVc1TxCAFzB5vYet2MJAu8NTzqK40KQVtC8=
X-Received: by 2002:a9f:3102:: with SMTP id m2mr4619617uab.10.1611974342646;
 Fri, 29 Jan 2021 18:39:02 -0800 (PST)
MIME-Version: 1.0
References: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
 <20210129210511.GA50742@jeremy-acer>
In-Reply-To: <20210129210511.GA50742@jeremy-acer>
Date: Sat, 30 Jan 2021 08:08:53 +0530
Message-ID: <CAHbM3qgFvQvU1BSWq90-OWQaqG-mkh+j-_9aSJALnFELU7WByw@mail.gmail.com>
Subject: Re: winbind cache issue for NDR entries
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Jeremy. The patch you provided works and I only had to do a slight
modification to it. Below is the updated patch.

Thanks,
Shilpa

diff --git a/source3/winbindd/winbindd_cache.c
b/source3/winbindd/winbindd_cache.c
index 0e51ae5..6ee733a 100644
--- a/source3/winbindd/winbindd_cache.c
+++ b/source3/winbindd/winbindd_cache.c
@@ -132,7 +132,7 @@ static struct winbind_cache *get_cache(struct
winbindd_domain *domain)
                domain->backend = &sam_passdb_methods;
        }

-       if ( !domain->initialized ) {
+       if ( !domain->initialized && !domain->online ) {
                /* We do not need a connection to an RW DC for cache
operation */
                init_dc_connection(domain, false);
        }
@@ -509,6 +509,40 @@ static bool store_cache_seqnum( struct winbindd_domain
*domain )
                                   domain->last_seq_check);
 }

+void force_refresh_domain_sequence_number(struct winbindd_domain *domain)
+{
+       NTSTATUS status;
+
+       /* domain->backend to could be NULL when this function is called
+        * from set_domain_online. make sure to reinitialize the backend */
+        get_cache(domain);
+
+       if (winbindd_can_contact_domain(domain)) {
+               status = domain->backend->sequence_number(domain,
+                                                 &domain->sequence_number);
+       } else {
+               /* just use the current time */
+               status = NT_STATUS_OK;
+               domain->sequence_number = time(NULL);
+       }
+
+       if (!NT_STATUS_IS_OK(status)) {
+               DEBUG(10, ("failed with %s\n", nt_errstr(status)));
+               domain->sequence_number = DOM_SEQUENCE_NONE;
+       }
+
+       domain->last_status = status;
+       domain->last_seq_check = time(NULL);
+
+       /* save the new sequence number in the cache */
+       store_cache_seqnum(domain);
+
+       DEBUG(10, ("%s seq number is now %"PRIu32"\n",
+                  domain->name, domain->sequence_number));
+
+       return;
+}
+
 /*
   refresh the domain sequence number. If force is true
   then always refresh it, no matter how recently we fetched it
@@ -554,34 +588,7 @@ static void refresh_sequence_number(struct
winbindd_domain *domain, bool force)
                goto done;
        }

-       /* important! make sure that we know if this is a native
-          mode domain or not.  And that we can contact it. */
-
-       if ( winbindd_can_contact_domain( domain ) ) {
-               status = domain->backend->sequence_number(domain,
-
&domain->sequence_number);
-       } else {
-               /* just use the current time */
-               status = NT_STATUS_OK;
-               domain->sequence_number = time(NULL);
-       }
-
-
-       /* the above call could have set our domain->backend to NULL when
-        * coming from offline to online mode, make sure to reinitialize the
-        * backend - Guenther */
-       get_cache( domain );
-
-       if (!NT_STATUS_IS_OK(status)) {
-               DEBUG(10,("refresh_sequence_number: failed with %s\n",
nt_errstr(status)));
-               domain->sequence_number = DOM_SEQUENCE_NONE;
-       }
-
-       domain->last_status = status;
-       domain->last_seq_check = time(NULL);
-
-       /* save the new sequence number in the cache */
-       store_cache_seqnum( domain );
+       force_refresh_domain_sequence_number(domain);

 done:
        DEBUG(10, ("refresh_sequence_number: %s seq number is now %d\n",
@@ -5084,7 +5091,8 @@ bool wcache_fetch_ndr(TALLOC_CTX *mem_ctx, struct
winbindd_domain *domain,
                        goto fail;
                }
                entry_seqnum = IVAL(data.dptr, 0);
-               if (entry_seqnum != dom_seqnum) {
+
+               if (wcache_server_down(domain) || (entry_seqnum !=
dom_seqnum)) {
                        DEBUG(10, ("Entry has wrong sequence number: %d\n",
                                   (int)entry_seqnum));
                        goto fail;


diff --git a/source3/winbindd/winbindd_cm.c b/source3/winbindd/winbindd_cm.c
index e0466da..faf1a62 100644
--- a/source3/winbindd/winbindd_cm.c
+++ b/source3/winbindd/winbindd_cm.c
@@ -552,6 +552,7 @@ static void set_domain_online(struct winbindd_domain
*domain)
                             MSG_WINBIND_FAILED_TO_GO_ONLINE, NULL);

        domain->online = True;
+       force_refresh_domain_sequence_number(domain);

        /* Send a message to the parent that the domain is online. */
        if (parent_pid > 1 && !domain->internal) {

diff --git a/source3/winbindd/winbindd_proto.h
b/source3/winbindd/winbindd_proto.h
index 55d5337..cc61ac0 100644
--- a/source3/winbindd/winbindd_proto.h
+++ b/source3/winbindd/winbindd_proto.h
@@ -56,7 +56,7 @@ NTSTATUS rpc_lookup_sids(TALLOC_CTX *mem_ctx,
                         struct lsa_TransNameArray **pnames);

 /* The following definitions come from winbindd/winbindd_cache.c  */
-
+void force_refresh_domain_sequence_number(struct winbindd_domain *domain);
 NTSTATUS wcache_cached_creds_exist(struct winbindd_domain *domain, const
struct dom_sid *sid);
 NTSTATUS wcache_get_creds(struct winbindd_domain *domain,
                          TALLOC_CTX *mem_ctx,


On Sat, Jan 30, 2021 at 2:35 AM Jeremy Allison <jra@samba.org> wrote:

> On Fri, Jan 29, 2021 at 07:39:40PM +0530, Shilpa K via samba-technical
> wrote:
> >Hello,
> >
> >We had a customer report that the users were not able to login for about
> >30minutes and the problem cleared itself in almost about 30minutes. They
> >are using Samba as a member server in a domain which has 2 way trust with
> >another domain (say ABC.COM). Upon investigation, we found that there
> was a
> >problem with trusted domain DCs for a very short duration as per the event
> >log on the DC of the primary domain. This problem seems to have been
> >cleared away after a short duration. Around the same time, a user
> belonging
> >to a trusted domain mapped Samba share and encountered a problem. At this
> >time, looks like NDR cache entry for trusted domain group "Domain Users"
> >was added in winbindd_cache.tdb to indicate that there was a lookup
> problem
> >and the status NT_STATUS_TRUSTED_DOMAIN_FAILURE was stored as part of this
> >entry. Once the issue with trusted domain DC was cleared and the domain
> was
> >back online, when users tried to login, PAM_AUTH was successful for the
> >users but getpwnam failed while looking up SID for "Domain Users". This
> >failure was returned from the entry in the winbindd_cache.tdb as
> >wcache_fetch_ndr() succeeded for this entry. Due to this, users belonging
> >to the trusted domain were not able to login. Once the cache was expired,
> >getpwnam succeeded for trusted domain users and the shares could be
> mapped.
> >In order to resolve this issue, should we not refresh the sequence number
> >when the domain goes online? Btw, we are using "winbind cache time =
> 1800".
>
> Yep, looks like we should add a call to force a refresh of the
> sequence number in the cache here:
>
> source3/winbindd/winbindd_cm.c:set_domain_online()
>
>   538
>   539         domain->online = True;
>   540
>
> Add a force_refresh_domain_sequence_number(domain) call above.
>
> Here is a (raw, untested) patch that implements this.
>
> Any chance you can test this for me ?
>
> Jeremy.
>
