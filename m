Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E035A3B788E
	for <lists+samba-technical@lfdr.de>; Tue, 29 Jun 2021 21:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HAI74XPg1eycCM+AtnjroT1PaC+KqBAgIpqiVe/g6Hk=; b=mfIsQ50IDzRTu0Ha6FIqwv7h6k
	yzowG5ekOQP4bozDhwJZgIGiBsoKKnAILZ+aRwQWLuoLwNZ6gyAYm70gzeRIgxCE9/zHlEVy7SlW2
	oXv+JeHWQc8UhgSxvaOzogjw2M2X14bdeEAqzu3+8eaKMBmjcYDzUZF6v+FOodCmZ8dzi0+U6K3Jc
	SZGsl43G7Zj1raJjkVojy+BQkevM011VBPQXiNOjQzdbGgpHXbnMFhDDR7/r0hovc+TAcUOM16023
	MLmV4t0MIgB/+2fhhQVZwmW9sgOOVjlQqG7MoeeIPCcyfjJoVLjehRdBxYPMmQhkM13jcWV4poFBl
	gcaIVd2g==;
Received: from ip6-localhost ([::1]:51258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lyJJu-0091Rt-Cy; Tue, 29 Jun 2021 19:22:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21632) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lyJJn-0091Rk-Vd
 for samba-technical@lists.samba.org; Tue, 29 Jun 2021 19:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624994563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=32578GwktCHVIApi9xqqL7l7z9XwoK29nawsDYtA7js=;
 b=CJX1XxXbAR5vgFySwYc77KR1gURoiGlC/QdmbNcGjcA5LNJ0em6hCxxXZAqLGWBOEn14vE
 h3WujV/I9KKecPxkjumI7jKBvyzyTGDXBp+4cLohrbZH7kS0fTxe9R8C/xvNliUKRb6Wt1
 MpSG7A1mksGL0U/krYKEFAewWoGEnls=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624994563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=32578GwktCHVIApi9xqqL7l7z9XwoK29nawsDYtA7js=;
 b=CJX1XxXbAR5vgFySwYc77KR1gURoiGlC/QdmbNcGjcA5LNJ0em6hCxxXZAqLGWBOEn14vE
 h3WujV/I9KKecPxkjumI7jKBvyzyTGDXBp+4cLohrbZH7kS0fTxe9R8C/xvNliUKRb6Wt1
 MpSG7A1mksGL0U/krYKEFAewWoGEnls=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-61Kk-9qUN1Chv1__S1uLIw-1; Tue, 29 Jun 2021 15:22:41 -0400
X-MC-Unique: 61Kk-9qUN1Chv1__S1uLIw-1
Received: by mail-pj1-f72.google.com with SMTP id
 om5-20020a17090b3a85b029016eb0b21f1dso2848015pjb.4
 for <samba-technical@lists.samba.org>; Tue, 29 Jun 2021 12:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=32578GwktCHVIApi9xqqL7l7z9XwoK29nawsDYtA7js=;
 b=MVs7b6Qcsi7qpgtga7Asr49WSohx7LkgAk/yVzsXYhX5pE3vfurqFY3KsFXKrZomDu
 DCAgnrpOJnrsBfWO8t5dadxG0rNPdwVBRmAwWyMson/thYqycO6Lrr+8Js/5++j2scL+
 BAiMLLL3TAmDyF6nBGGp9lazgpC1kZ0cUTiGNoDDOvXBaQtrd2j2e/t3NazV9y4LidO8
 Gm2r0DAck2BWvyScJmthHjQ36jj6rCilsS3w4s1MY6lpwCTc4cg0utnS7exwBS0xk7ZX
 61ygKWnLPSGpGDrxRqyWDzCkwjXqmQg+vF2vcNZr3B3guquW27ZhkUoODpxeulA6cljV
 tN0A==
X-Gm-Message-State: AOAM531TPd+GdUXwFBv1Y2AbVodfmVMsoYw2Mhmk8NZgCmc4Wx/mIXSv
 to+GwNEk6KqR0eaPbtTPbSKg1pQyv5cV8tuk5OXxau1OGX6bpoBOLq0/zw65DE3DGacL4aenWzq
 lXfBAdPBbmBmcE88fJFBn6fOA7VV8cY72ifMXgvl2vNpy
X-Received: by 2002:a62:8097:0:b029:306:7dfc:fa0 with SMTP id
 j145-20020a6280970000b02903067dfc0fa0mr31647335pfd.17.1624994560095; 
 Tue, 29 Jun 2021 12:22:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXxmAQDzL+ee14OCAUClB+pxE2tNmPBhiwFfRoV1uB1UVHSxwPMECypacsEVVs16sJnOfAHtUaSS/SML2YLOI=
X-Received: by 2002:a62:8097:0:b029:306:7dfc:fa0 with SMTP id
 j145-20020a6280970000b02903067dfc0fa0mr31647322pfd.17.1624994559840; Tue, 29
 Jun 2021 12:22:39 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 29 Jun 2021 21:22:28 +0200
Message-ID: <CAEcb10uXPGgAmZSqZ71PRSEbo+ZiNkem-CmH4afBPemnmXAdZQ@mail.gmail.com>
Subject: key version number in fill_mem_keytab_from_secrets()
To: metze@samba.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Stefan,

can you please help me and answer my questions related to feature
'Implement 'update keytab' for winbind and tools' (
https://gitlab.com/samba-team/samba/-/merge_requests/1999).

You commented in MR 1999:
*I also fail to see where we add the keys for the old(er) passwords.
Shouldn't we just dump the keys from in memory keytab (which is filled from
the precalculated hashed of secrets.tdb) into the file keytab.*
--------------------------------------------------
A) fill_mem_keytab_from_secrets()
--------------------------------------------------
I have checked the code in fill_mem_keytab_from_secrets() and what it does
is (code is simplified):

krb5_kvno kvno = 0; /* FIXME: fetch current vno from KDC ? */
fill_keytab_from_password(krbctx, *keytab, princ, kvno, info->password);
fill_keytab_from_password(krbctx, *keytab, princ, kvno - 1,
info->old_password);
fill_keytab_from_password(krbctx, *keytab, princ, kvno - 2,
info->older_password);
fill_keytab_from_password(krbctx, *keytab, princ, kvno - 3,
info->next_change->password);

I see two issues here:
1) kvno is incorrectly initialized and keys are added with unreal values:
vno=0
vno=4294967295  (-1)
vno=4294967294  (-2)
vno=4294967293  (-3)   ###  btw. the semantics of next_change is more (kvno
+ 1) than (kvno - 3)

2) info->next_change->password should not be passed to
fill_keytab_from_password().
next_change, if exists, refers to a password change in progress, and should
not be used before it is accepted and finalized, then it will become
info->password and only then it will be added to keytab.

Q: How is it possible that it works with wrong vnos?

--------------------------------------------------
B) ads_keytab_create_default()
--------------------------------------------------
this is the code I use to implement keytab update. It does:

* ads_get_service_principal_names() and adds keys for all SPNs via
ads_keytab_add_entry()
* adds keys for sam_account_name and UPN via ads_keytab_add_entry()
* It stores SPNs from keys with (kt_entry.vno != kvno) into array
oldEntries and for whole array ads_keytab_add_entry(ads, res,
oldEntries[i], false) is called

Every call of ads_keytab_add_entry() also calls
smb_krb5_kt_seek_and_delete_old_entries(), which deletes all keys with vno
< vno -1 (i.e. vno -2, vno -3, ....) for given principal.
So it should also ensure that old (but not older password and it's keys)
are in keytab.

Q: Do we also need the older password and why? If needed, isn't it better
just to avoid its removal from keytab, instead of filling it from
secrets.tdb (or from in memory keytab)?


Cheers,
Pavel
