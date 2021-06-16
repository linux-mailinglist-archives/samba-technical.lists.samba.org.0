Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8F3A9588
	for <lists+samba-technical@lfdr.de>; Wed, 16 Jun 2021 11:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZEELOBRcx89CetXXRDQhms06SsV5tr6lHgWkwu+87P8=; b=zZ9g5vHIWc9xDsC5XRSa36Mhwi
	5aHbzv3CIujFeIIQPNZwDM6JhZhmLogTVR7Gjs3SCzD1PbOMyf7mQj6bnKBfpqUUTaPEqvaJCvKro
	PfE+0oF7f+ZNogtOmHc4m7ke8tCkR8sm4L9DDE3jcqbAMeimkLENqbDxmvygie9dWwWzWUroIaitU
	KyWzZ9mnR7442n/N6/3gDtCiyFlcbdLcD3ygq0HAkYhOZ90BPB6sJxzOh7CqvMvlQeXvubZR2d/zg
	LRdDRf62GItjj3MUk+uwuzuru6nFYgpQQ6VGPYiSfwOFwk8QvRSji2TWqDIB/ssyLkKBNbmnh0HkP
	baSpjLGQ==;
Received: from ip6-localhost ([::1]:38086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ltRUB-006EM8-4x; Wed, 16 Jun 2021 09:05:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26844) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ltRU2-006ELy-25
 for samba-technical@lists.samba.org; Wed, 16 Jun 2021 09:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623834310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=ccJdyRiHjFjxYS79nLpGsYgqwL5s6iLUsowuxWQrIfc=;
 b=SccPl/7Wr0vUNBzLgtwnOfEzfq3ESDl3t9Rs9QKWXPmPFlrsg5tJNpZ5oIE0P+Y5LIDLwb
 BqplbDmYVWbAXukeaDfmGiKrjzVMPcAASlxZq2YzahWd/Md+7dDE7r9r4wUvpH9jNtP5uL
 npRazBpFVKG3W6hEO0r4WaL6jfEaK6g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623834310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=ccJdyRiHjFjxYS79nLpGsYgqwL5s6iLUsowuxWQrIfc=;
 b=SccPl/7Wr0vUNBzLgtwnOfEzfq3ESDl3t9Rs9QKWXPmPFlrsg5tJNpZ5oIE0P+Y5LIDLwb
 BqplbDmYVWbAXukeaDfmGiKrjzVMPcAASlxZq2YzahWd/Md+7dDE7r9r4wUvpH9jNtP5uL
 npRazBpFVKG3W6hEO0r4WaL6jfEaK6g=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494--s7immbOOZ-PKYeDeo0Zzg-1; Wed, 16 Jun 2021 04:49:30 -0400
X-MC-Unique: -s7immbOOZ-PKYeDeo0Zzg-1
Received: by mail-pl1-f197.google.com with SMTP id
 bh7-20020a170902a987b029011744126551so408328plb.3
 for <samba-technical@lists.samba.org>; Wed, 16 Jun 2021 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=scRnWfLkR2tJcslRFUhirnZ9r326j2K7KeqzZAcvV0Y=;
 b=Fz50RUZseKx1sV2VnX25cRgVIgntdQXBjUObyelsEI/smCeoBQaeqf9eeqdX1VK43E
 sb9EQQBdTg1aAOg4sGJEYvlWI6HGkIW4D4fbWWdnOoXy0UBWRtWfl2g0M+L4XOuNE84x
 4g02zjiWygqtv/efG83aEaE0N+6FMO7g2wSA1XFptVApm+L2ijMYmVFPG5K/OqgVGrjO
 qyobZdsdXT+OKXc/yKXC6GLMxqpg8IB3TvIbKMgghQeP3d9clSm7of/Uphnpg+6SEXIO
 zA6x3noRTFFyvydb2BUeze3RMLME9/4h+bGxlgb2Iy61ZLkfe+njSuRXUNNy+1buRw0T
 f90w==
X-Gm-Message-State: AOAM532pukTscp8HCba0sGsmIopO4X60SbIzrKbh2eYsVOulS8de4Hxw
 NOiIXdPj3YwOZ8SNmbujTl+yS5IR6E99A84MK0+UXT1bMYX2XdlvjBdJYXcwMPS69UQpScKR/O8
 tngYOxSWJG3PQf2hDi81mcj9Bz5SqlW2DW13HiX0i9+i6
X-Received: by 2002:a63:6c6:: with SMTP id 189mr3842932pgg.366.1623833369511; 
 Wed, 16 Jun 2021 01:49:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+8tVvOnLlXdgfbsn7cZchTnImNPzvS4RruEfKOvmJt/FfRVDdj8K4yhGskTzcCyhNilTxGiakIC9hMp3KcPo=
X-Received: by 2002:a63:6c6:: with SMTP id 189mr3842904pgg.366.1623833369062; 
 Wed, 16 Jun 2021 01:49:29 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Jun 2021 10:49:18 +0200
Message-ID: <CAEcb10vV+557J6mTRRw+tjTh8x34b0tud-7V2GYkzCTOMgquxw@mail.gmail.com>
Subject: duplicit LDAP calls
To: samba-technical@lists.samba.org
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

during my my learning/observation of how machine account password is
changed via net ads changetrsutpw I have noticed that two same LDAP calls
are done in ads_keytab_add_entry() in source3/libads/kerberos_keytab.c  :

391 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7my_fqdn =3D ads_get_dns=
hostname(ads, tmpctx, lp_netbios_name());

...
400 =C2=BB=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7=C2=B7if (!ads_has_samaccount=
name(ads, tmpctx, lp_netbios_name())) {


Both ads_get_dnshostname() and ads_has_samaccountname() call
ads_find_machine_acct() and trigger exactly same LDAP search and get the
same response. I guess there are more places where an unnecessary network
call is done, but at least for this case it is easy to refactor the code to
avoid it. Does  it makes sense to gain performance for possibly less
structured code?

Cheers,
Pavel

This request is send twice:

            LDAPMessage searchRequest(7)
"dc=3DADDOM,dc=3DSAMBA,dc=3DEXAMPLE,dc=3DCOM" wholeSubtree
                messageID: 7
                protocolOp: searchRequest (3)
                    searchRequest
                        baseObject: dc=3DADDOM,dc=3DSAMBA,dc=3DEXAMPLE,dc=
=3DCOM
                        scope: wholeSubtree (2)
                        derefAliases: neverDerefAliases (0)
                        sizeLimit: 0
                        timeLimit: 15
                        typesOnly: False
                        Filter: (samAccountName=3DADMEMKEYTAB$)
                            filter: equalityMatch (3)
                                equalityMatch
                                    attributeDesc: samAccountName
                                    assertionValue: ADMEMKEYTAB$
                        attributes: 10 items
                            AttributeDescription: objectClass
                            AttributeDescription: SamAccountName
                            AttributeDescription: userAccountControl
                            AttributeDescription: DnsHostName
                            AttributeDescription: ServicePrincipalName
                            AttributeDescription: userPrincipalName
                            AttributeDescription: unicodePwd
                            AttributeDescription: msDS-AdditionalDnsHostNam=
e
                            AttributeDescription:
msDS-SupportedEncryptionTypes
                            AttributeDescription: nTSecurityDescriptor
