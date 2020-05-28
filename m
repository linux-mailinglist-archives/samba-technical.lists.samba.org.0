Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDFD1E53D2
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 04:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=rRGDFA7Ebbty31yxR1LJTaCiMH44Ed0HOaQCvRb/TcM=; b=3FWCPE2bYj3/2iYCbnfsE+gPL8
	nGyabUcbPPJ8U5qOcX2XoOHp9uRNpk3tZXyxkh4o3EEgzGA+xE7nMtadsjWgyP1qTNHHkl8X9Y+LY
	QLZ/59PfpvYDxl0upA83TnVjeKwGIzv/s96Y1wNmBIjpXZH92bZmlLbDAXK/Ha/4ppSPrhY/Niwgd
	2fxh/wHRViPkLCeWieFySpgpQ9SSB2P3fEWG/f8kUPsvj5vECD3fB5E41Pyxsz7rY7FEOPM/86oKP
	z8vLfezCaFuMNNCXNhxXmiuD/qDix4oF+mtApYfBE/o3raN+uFEk5rV8S15RuiGrVpDIL4sQwDRiA
	Fa+tSKRw==;
Received: from localhost ([::1]:29714 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je89e-0067FX-0D; Thu, 28 May 2020 02:20:22 +0000
Received: from mx2.suse.de ([195.135.220.15]:42570) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1je89P-0067FQ-Nh
 for samba-technical@lists.samba.org; Thu, 28 May 2020 02:20:12 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9AE64B24D;
 Thu, 28 May 2020 02:20:06 +0000 (UTC)
Message-Id: <0326D940-8BDC-4FE2-A7D4-00276A982979@suse.de>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_4BB9A484-59C1-48E9-9504-59948FD64305"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Schema updates and modern Samba AD
Date: Thu, 28 May 2020 12:19:58 +1000
In-Reply-To: <01157baedc07f140b5a253a1813137a4f16196e2.camel@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
 <E89015B7-BFCD-4731-82F9-AE09FE73C52A@suse.de>
 <01157baedc07f140b5a253a1813137a4f16196e2.camel@samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
From: William Brown via samba-technical <samba-technical@lists.samba.org>
Reply-To: William Brown <wbrown@suse.de>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--Apple-Mail=_4BB9A484-59C1-48E9-9504-59948FD64305
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 27 May 2020, at 14:41, Andrew Bartlett <abartlet@samba.org> wrote:
>=20
> On Wed, 2020-05-27 at 13:53 +1000, William Brown via samba-technical
> wrote:
>>>=20
>>=20
>>=20
> https://docs.microsoft.com/en-us/windows/win32/ad/extending-the-schema
>>=20
>> Generally, I'd say the biggest thing is that it's a one way street -
>> you can add, but never remove, so that means your changes have to be
>> very carefully considered, because a mistake can't easily be undone.
>>=20
>> For example, if the ssh public key schema shipped in AD, the fact is
>> has a "must" not "may" on the ldapPublicKey attribute makes it
>> extremely hard to use in a self management scenario.
>>=20
>> So my input (for what it's worth) is that schema changes should be
>> considered carefully, and the consequences understood, as well as the
>> ergonomics of how those changes will interface with access controls
>> and that human interaction.=20
>>=20
>> Hope that helps,
>=20
> G'Day William,
>=20
> It is a wiki, feel free to craft some suitable guidance and add it!

Done, but I'm not able to upload files. Can you add the following for =
me? Then I can fix up some links in the page.

Thanks!=20


--Apple-Mail=_4BB9A484-59C1-48E9-9504-59948FD64305
Content-Disposition: attachment;
	filename=ldapcompat.ldif.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="ldapcompat.ldif.txt"
Content-Transfer-Encoding: 7bit


dn: CN=nsUniqueId,${SCHEMADN}
changetype: add
objectClass: top
objectClass: attributeSchema
attributeID: 2.16.840.1.113730.3.1.542
cn: nsUniqueId
name: nsUniqueId
lDAPDisplayName: nsUniqueId
description: MANDATORY: nsUniqueId compatability
attributeSyntax: 2.5.5.10
oMSyntax: 4
isSingleValued: TRUE
searchFlags: 9
objectCategory: CN=Attribute-Schema,${SCHEMADN}
schemaIDGUID:: PTIIe1afdUKi0To2hxU1zg==

dn: CN=entryUUID,${SCHEMADN}
changetype: add
objectClass: top
objectClass: attributeSchema
attributeID: 1.3.6.1.1.16.4
cn: entryUUID
name: entryUUID
lDAPDisplayName: entryUUID
description: MANDATORY: entryUUID compatability
attributeSyntax: 2.5.5.10
oMSyntax: 4
isSingleValued: TRUE
searchFlags: 9
objectCategory: CN=Attribute-Schema,${SCHEMADN}
schemaIDGUID:: mqcwg4e++kmQIA2VphN1oQ==

dn: CN=ldapCompatPerson,${SCHEMADN}
changetype: add
objectClass: top
objectClass: classSchema
governsID: 1.3.6.1.4.1.7165.4.2.3
cn: ldapCompatPerson
name: ldapCompatPerson
description: MANDATORY: Unix LDAP compat person
lDAPDisplayName: ldapCompatPerson
subClassOf: top
objectClassCategory: 3
objectCategory: CN=Class-Schema,${SCHEMADN}
defaultObjectCategory: CN=ldapCompatPerson,${SCHEMADN}
mayContain: nsUniqueId
mayContain: entryUUID
schemaIDGUID:: 86ZQNhW9JE6cXG/Mb03K4Q==


--Apple-Mail=_4BB9A484-59C1-48E9-9504-59948FD64305
Content-Disposition: attachment;
	filename=sshpubkey.ldif.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="sshpubkey.ldif.txt"
Content-Transfer-Encoding: 7bit

dn: CN=sshPublicKey,${SCHEMADN}
changetype: add
objectClass: top
objectClass: attributeSchema
attributeID: 1.3.6.1.4.1.24552.500.1.1.1.13
cn: sshPublicKey
name: sshPublicKey
lDAPDisplayName: sshPublicKey
description: MANDATORY: OpenSSH Public key
attributeSyntax: 2.5.5.10
oMSyntax: 4
isSingleValued: FALSE
objectCategory: CN=Attribute-Schema,${SCHEMADN}
searchFlags: 8
schemaIDGUID:: cjDAZyEXzU+/akI0EGDW+g==

dn: CN=ldapPublicKey,${SCHEMADN}
changetype: add
objectClass: top
objectClass: classSchema
governsID: 1.3.6.1.4.1.24552.500.1.1.2.0
cn: ldapPublicKey
name: ldapPublicKey
description: MANDATORY: OpenSSH LPK objectclass
lDAPDisplayName: ldapPublicKey
subClassOf: top
objectClassCategory: 3
objectCategory: CN=Class-Schema,${SCHEMADN}
defaultObjectCategory: CN=ldapPublicKey,${SCHEMADN}
mayContain: sshPublicKey
schemaIDGUID:: +8nFQ43rpkWTOgbCCcSkqA==


--Apple-Mail=_4BB9A484-59C1-48E9-9504-59948FD64305
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


>=20
> Thanks,
>=20
> Andrew Bartlett
>=20
> --=20
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT         =20
> https://catalyst.net.nz/services/samba
>=20
>=20
>=20

=E2=80=94
Sincerely,

William Brown

Senior Software Engineer, 389 Directory Server
SUSE Labs


--Apple-Mail=_4BB9A484-59C1-48E9-9504-59948FD64305--

