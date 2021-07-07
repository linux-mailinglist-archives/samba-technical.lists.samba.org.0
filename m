Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D616D3BF03C
	for <lists+samba-technical@lfdr.de>; Wed,  7 Jul 2021 21:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qqBATYfrYmxxD3kTflhF3RhpSlpxnQSrOVgomDzs7OY=; b=xQ08aHgfBNtvRUVrymYDhZLxAW
	G/8KpNVmFMIpfVTToUIqZ3+2noHrA8O6x6NDXjOjcFe2kqfa1n5G2PCEESn0qX3rGswyD3ekun6T1
	Q7pM3rPliQRfK+BQU69YxEIr/BLYg70sSn2sAKGrZiSy+tUVjlgnBMDt5TO8BuP5PlhJZQyWDvIjk
	XL+HvIvAteD5ssTa8GIYYYlscD44D8gx09faaO78tUX2eJ+o2ayIkshnroleAO69PlRheJMV6YdcX
	QWzXmpgASMOjtHqAskOO0tRfCcqDok7mwKeUMEELIhQ7OvuZgdYSSnchD6iEn2E5Eek8IcecYOnb1
	lByAJdDw==;
Received: from ip6-localhost ([::1]:30540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m1DAZ-00CfgR-8y; Wed, 07 Jul 2021 19:25:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58641) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1m1DAP-00CfgI-Va
 for samba-technical@lists.samba.org; Wed, 07 Jul 2021 19:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625685902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUb3f6mtJWH6yDgztT8gi1Cmgz19wtSbcYE6+s+dAQQ=;
 b=bLICwjtz4vAuXWtBMfdySDS9tMno8ynuUwfuCeYmbwLlGhKAshVSQRPqx7JbswxpJ7MsrT
 z6MpZGtB0Vpng6Jpv88Kw+zm08nqAitCRkXGK4WUlsv3gB75KIth7zM7DslFVzkDnG2g+F
 XBpl7eNRVoREKsTF4F8kwfaFLSXPO+U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625685902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LUb3f6mtJWH6yDgztT8gi1Cmgz19wtSbcYE6+s+dAQQ=;
 b=bLICwjtz4vAuXWtBMfdySDS9tMno8ynuUwfuCeYmbwLlGhKAshVSQRPqx7JbswxpJ7MsrT
 z6MpZGtB0Vpng6Jpv88Kw+zm08nqAitCRkXGK4WUlsv3gB75KIth7zM7DslFVzkDnG2g+F
 XBpl7eNRVoREKsTF4F8kwfaFLSXPO+U=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-L_8rEYVKPrKQhmpqdMhNKA-1; Wed, 07 Jul 2021 15:24:58 -0400
X-MC-Unique: L_8rEYVKPrKQhmpqdMhNKA-1
Received: by mail-pj1-f71.google.com with SMTP id
 lb18-20020a17090b4a52b02901727f0a3730so2132077pjb.0
 for <samba-technical@lists.samba.org>; Wed, 07 Jul 2021 12:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUb3f6mtJWH6yDgztT8gi1Cmgz19wtSbcYE6+s+dAQQ=;
 b=X/h51PWhH/DLklqCT9WgMqEtb39TDJedNGwQOhWlCRr0aq91IfduTSGzM7iMAuyvmS
 Gj4uE3swdq1bHaLARdCois9IyGVFf2jUCrtM4Y5eZmbEgOCQOORflswj7ySBiNrjBVen
 nK5Lvx+Kea6Avn24tMCi8PFc8Z56LNp8p8quK9ldQB4gLR85pWhzL4qfiI47LwAeetNE
 ARiasrSczWhq6wBOnUms1jw3+HS83ilHjiQfp51UzX3B/GoD1AVpvh9dO4pFXqsX1s3z
 MAKudPX5SQa3GSO4dcz0Kow//aYHVzozPSiB/VYjfvYjoOWhDFzGDpZX8d+F2OXdO6IV
 q8ww==
X-Gm-Message-State: AOAM532U0wNnUFFrESteyhf0lhj3n0ZwvlcgSVc88hDHBf+yl83tJiTv
 TH8vfC9JTXBBjT3O/Oj9D1eLzylCs4RZghLHsSitq18xxTg1eD7rHlUT7CP9KcJbU0OQR47VR3b
 1ax9wzeRDUr+rPSU/68HRIIBzbYhPrUKpdV36jhTBhZzQ
X-Received: by 2002:a17:903:191:b029:129:c0d2:33fa with SMTP id
 z17-20020a1709030191b0290129c0d233famr5094943plg.21.1625685896958; 
 Wed, 07 Jul 2021 12:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7iQyYtHt9gi89kCHA168KGZFCWvPfnCGqE692MvuRdB7D59f1G9CD4Thp5P35Oy4gBmXtoZgJKnIC8WTRG4k=
X-Received: by 2002:a17:903:191:b029:129:c0d2:33fa with SMTP id
 z17-20020a1709030191b0290129c0d233famr5094905plg.21.1625685896472; Wed, 07
 Jul 2021 12:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10uXPGgAmZSqZ71PRSEbo+ZiNkem-CmH4afBPemnmXAdZQ@mail.gmail.com>
 <f4023375-0dcb-f817-7429-43b5bb78c3fa@samba.org>
In-Reply-To: <f4023375-0dcb-f817-7429-43b5bb78c3fa@samba.org>
Date: Wed, 7 Jul 2021 21:24:45 +0200
Message-ID: <CAEcb10sYx8JxRMTMhC6FCJK17Oh6Bv-F08JApgQAi2kjR5aKzg@mail.gmail.com>
Subject: Re: key version number in fill_mem_keytab_from_secrets()
To: Stefan Metzmacher <metze@samba.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze,

thanks for the valuable response. I have added to MR 1999
https://gitlab.com/samba-team/samba/-/merge_requests/1999/diffs four new
commits that implement your suggestions:

a) adding keys from secrets for pw, old pw, older pw and next pw
b) smb_krb5_kt_seek_and_delete_old_entries() is updated to keep also kvno-2
(or should it also be kvno-3?, I do not think so....)

The new commits are:

4. 3d31053 2021-07-07 20:06 +0200 Pavel Filipensk=C3=BD   o krb5_wrap: add
DEVELOPER trace support for keys operations
3. 06659b0 2021-07-07 19:40 +0200 Pavel Filipensk=C3=BD   o krb5_wrap:
smb_krb5_kt_seek_and_delete_old_entries() saves also keys with kvno-2
2. 38b7bda 2021-07-06 18:10 +0000 Pavel Filipensk=C3=BD   o s3:lib: add to
keytab keys from secrets for pw, old pw, older pw and next pw
1. d6098a0 2021-07-06 17:48 +0000 Pavel Filipensk=C3=BD   o krb5_wrap: move
fill_keytab_from_password() to lib/krb5_wrap as
smb_krb5_fill_keytab_from_secrets_password()


#1
 - just makes fill_keytab_from_password() re-usable

#2
  -  adds to keytab keys for rom secrets for pw, old pw, older pw and next
pw
  -  it does not implement removal of old values with kvno 0, -1, - 2, -3
since this is already done in smb_krb5_kt_seek_and_delete_old_entries()

#3
  - smb_krb5_kt_seek_and_delete_old_entries is extended to keep not only
kvno-1 but also kvno-2

#4
  - tracing available only #ifdef DEVELOPER is present for keytab
operations relevant to machine account pw change
  - three ops (get_next / add / remove) are traced with key details
including hex value that helps to check how exactly are keys manipulated

Two examples of the output:

$ bin/net ads keytab list -d10 2>&1|grep KEYTAB_TRACE
KEYTAB_TRACE                            ads_keytab_list:927  nxt
    host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
KEYTAB_TRACE                            ads_keytab_list:927  nxt
                            host/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
KEYTAB_TRACE                            ads_keytab_list:927  nxt
    host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
178d0df68a42f525ba0109455e5961e617
KEYTAB_TRACE                            ads_keytab_list:927  nxt
                            host/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
178d0df68a42f525ba0109455e5961e617
KEYTAB_TRACE                            ads_keytab_list:927  nxt
    host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
23a5f29b5a6a62ec92d482d0ffc6edb0d9

or

$ grep KEYTAB_TRACE
/home/pfilipen/workspace/projects/samba/st/ad_member_keytab/logs/log.wb-ADD=
OMAIN|egrep
' rem| add'|head  -22
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
      host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
                              host/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
      host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
178d0df68a42f525ba0109455e5961e617
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
                              host/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
178d0df68a42f525ba0109455e5961e617
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
      host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
23a5f29b5a6a62ec92d482d0ffc6edb0d9
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
                              host/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
23a5f29b5a6a62ec92d482d0ffc6edb0d9
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
 restrictedkrbhost/
admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
                 restrictedkrbhost/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
 restrictedkrbhost/
admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
178d0df68a42f525ba0109455e5961e617
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
                 restrictedkrbhost/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
178d0df68a42f525ba0109455e5961e617
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
 restrictedkrbhost/
admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
23a5f29b5a6a62ec92d482d0ffc6edb0d9
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
                 restrictedkrbhost/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
23a5f29b5a6a62ec92d482d0ffc6edb0d9
  KEYTAB_TRACE    smb_krb5_kt_seek_and_delete_old_entries:1653 rem
      host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
  KEYTAB_TRACE                      smb_krb5_kt_add_entry:1801 add
      host/admemkeytab.addom.samba.example.com@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393
  KEYTAB_TRACE    smb_krb5_kt_seek_and_delete_old_entries:1653 rem
                              host/ADMEMKEYTAB@ADDOM.SAMBA.EXAMPLE.COM  3
18e2c0a9098eb6ab85c3fa0462461d5c462d5323aea060a81c8469b20ac591a393


Cheers,
Pavel

On Wed, Jun 30, 2021 at 1:00 PM Stefan Metzmacher <metze@samba.org> wrote:

>
> Hi Pavel,
>
> > can you please help me and answer my questions related to feature
> > 'Implement 'update keytab' for winbind and tools' (
> > https://gitlab.com/samba-team/samba/-/merge_requests/1999).
> >
> > You commented in MR 1999:
> > *I also fail to see where we add the keys for the old(er) passwords.
> > Shouldn't we just dump the keys from in memory keytab (which is filled
> from
> > the precalculated hashed of secrets.tdb) into the file keytab.*
> > --------------------------------------------------
> > A) fill_mem_keytab_from_secrets()
> > --------------------------------------------------
> > I have checked the code in fill_mem_keytab_from_secrets() and what it
> does
> > is (code is simplified):
> >
> > krb5_kvno kvno =3D 0; /* FIXME: fetch current vno from KDC ? */
> > fill_keytab_from_password(krbctx, *keytab, princ, kvno, info->password)=
;
> > fill_keytab_from_password(krbctx, *keytab, princ, kvno - 1,
> > info->old_password);
> > fill_keytab_from_password(krbctx, *keytab, princ, kvno - 2,
> > info->older_password);
> > fill_keytab_from_password(krbctx, *keytab, princ, kvno - 3,
> > info->next_change->password);
> >
> > I see two issues here:
> > 1) kvno is incorrectly initialized and keys are added with unreal value=
s:
> > vno=3D0
> > vno=3D4294967295  (-1)
> > vno=3D4294967294  (-2)
> > vno=3D4294967293  (-3)   ###  btw. the semantics of next_change is more
> (kvno
> > + 1) than (kvno - 3)
>
> This is intended, we could also use 0 for all of them,
> the key is that we should not care about the kvno, as there is
> no reliable way to get the kvno.
>
> We the acceptor should just iterate overall keys (for the given
> encryption type) in the whole keytab and try to decrypt the ticket.
>
> If I remember correctly that's what MIT krb5 does and for
> Heimdal it's a bit random if it iterates the keytab, I think
> it iterates as long as the kvno didn't match, so it's better to use
> numbers which are very unlikely to be used by the KDC and for AD
> the kvno starts with 1 for the first password.
> I also created a GSS_KRB5_CRED_ITERATE_ACCEPTOR_KEYTAB_X for heimdal
> to ensure that it iterates the whole keytab, but it's not yet upstream,
> see https://github.com/heimdal/heimdal/pull/656
>
> Also note that Samba asks gss_accept_sec_context() to ignore the
> SPN values in the keytab, as it's also not possible to know all
> possible names, which are available on the DC.
>
> > 2) info->next_change->password should not be passed to
> > fill_keytab_from_password().
> > next_change, if exists, refers to a password change in progress, and
> should
> > not be used before it is accepted and finalized, then it will become
> > info->password and only then it will be added to keytab.
>
> No, info->next_change->password might be in progress for 4 reasons:
> 1. An error that happens before the password change reached the dc
> 2. The DC rejected the password change
> 3. The DC changed the password, but the success response didn't reach us
> 4. We we're not able to store the success (e.g. a ctdb failure in the
> cluster)
>
> But we can't really know/should not care about the difference between the=
se
> reasons. And for 1. and 3. it's not possible to find the difference.
> So we must be prepared to accept tickets encrypted with the in progress
> password. Naturally we also need to accept all tickets with all other
> passwords
> we know about, as ticket lifetimes are typically 10h and we have to deal
> with
> replication latency.
>
> > Q: How is it possible that it works with wrong vnos?
>
> The acceptor should ignore the kvno, I'm not how
> gss_accept_sec_context works in other applications,
> but for samba's usage I guess the iteration works
> (apart from heimdal without GSS_KRB5_CRED_ITERATE_ACCEPTOR_KEYTAB_X).
>
> > --------------------------------------------------
> > B) ads_keytab_create_default()
> > --------------------------------------------------
> > this is the code I use to implement keytab update. It does:
> >
> > * ads_get_service_principal_names() and adds keys for all SPNs via
> > ads_keytab_add_entry()
> > * adds keys for sam_account_name and UPN via ads_keytab_add_entry()
> > * It stores SPNs from keys with (kt_entry.vno !=3D kvno) into array
> > oldEntries and for whole array ads_keytab_add_entry(ads, res,
> > oldEntries[i], false) is called
> >
> > Every call of ads_keytab_add_entry() also calls
> > smb_krb5_kt_seek_and_delete_old_entries(), which deletes all keys with
> vno
> > < vno -1 (i.e. vno -2, vno -3, ....) for given principal.
> > So it should also ensure that old (but not older password and it's keys=
)
> > are in keytab.
>
> I guess '< kvno -1' comes from times before we stored secrets_domain_info=
B
> in secrets.tdb. Today would be '< kvno -3'...
>
> > Q: Do we also need the older password and why? If needed, isn't it bett=
er
> > just to avoid its removal from keytab, instead of filling it from
> > secrets.tdb (or from in memory keytab)?
>
> I think we want the kvno values to stay below 1 in order to have
> heimdal keep iterating the keytab.
>
> I'd do this (with kvno =3D 0):
> - remove all old values with kvno - 3
> - add all new values (if any) for kvno - 3
> - remove all old values with kvno - 2
> - add all new values (if any) for kvno - 2
> - remove all old values for kvno - 1
> - add all new values for kvno - 1
> - remove all old values for kvno
> - add all new values for kvno
>
> The worst thing that can happen is that some keys are stored under two
> kvno values,
> but we're sure at any given time the old values of kvno, kvno-1 and kvno-=
2
> are still
> in the keytab and we're ready to decrypt incoming tickets.
>
>
> I think 'net ads keytab create' asks a DC about the msDS-KeyVersionNumber=
,
> which
> is typically (but not reliable and always) the kvno. We may asks a DC tha=
t
> doesn't have
> the current password yet, or it already has the in progress password
> already or the DC always returns 1,
> see [MS-ADTS] 3.1.1.4.5.16 msDS-KeyVersionNumber:
>
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/cb85=
ccdf-6469-42d5-a61c-ebae09b72e9d
>
> Maybe we need an option to specify if the kvno should be fetched from the
> DC
> for 'net ads keytab ' commands.
>
> The kvno (as well as SPNs) might be important for some applications so
> we better keep the default behavior for the 'net ads keytab' commands.
>
> For legacy reasons this is all really complex in order to be compatible
> with all sorts of situations and setups.
>
> I hope I had some useful comments for you...
>
> metze
>
>
