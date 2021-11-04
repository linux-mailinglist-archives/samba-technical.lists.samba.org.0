Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C47034458DE
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 18:45:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=R3wK3JH8Rz2Oli+UdW5ez/KvpUxk9DBPm9Wno9bnnhk=; b=sfrZzqRQ3DU52Ml1nLQTjDtFO2
	XjsvF2/lA50SsuE27wyq29VIVhi4evQw7bvdCvK5pYftJ70IZ1O+SBgXb1C5Uf4nwBfX5BXnfh80G
	EYXExuNAPF+2kj34r4ReeVDRd86arTOiVNSjn/Sitgxps/BNGZng1XlA5xiallTQM1TTl8MrRMKyG
	JEEuWS8Js1GA9zbnGXIaXl5OLPv/wEiNuUMQs1ykeyLFR+9hLKU0w2kFv68y0r/LX+KP3imXr6u3c
	bllSpztaH0vwE3Yq9W/xa+boz6fu4dt3txJbYrL6RtybemAm9aCHAlSeeZUXh77ME0Z1ju4XRYUfW
	twUObDUg==;
Received: from ip6-localhost ([::1]:24288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mignH-007gvP-DB; Thu, 04 Nov 2021 17:44:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mignC-007gvG-El
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=R3wK3JH8Rz2Oli+UdW5ez/KvpUxk9DBPm9Wno9bnnhk=; b=yPt49aGDRLbpH8uyH7T0Q/Xbsr
 +Q6VrMmHvE3iXoag3KyrTzsCQdzb4dhCrhyZGiSaEN+pwDQjjrm0p8e/gtZrtj5rt9oe1BqSy+dB+
 pOeqhmNAV9a7sWX2WBDoBniOqESKRZyKvYgZRuNm5QUFaETQ5tnuaFZHKK7THDgNSWNV14urUkB3j
 7BZtR9jH6N7fUEoCsVb3LAEc/Nf3cpl6yVHQlUTn8VKz9L9mRuOFVPm15Y0R4bnwPRb0MRU88x8d4
 IcZbYwOPsJAIDzBHFrMMbA0w3xWuPqu0qVFxXXKbf5lOPRv/vQ4fhiiFPH6gtJmZ+qNMnNTnDkOz7
 GRHT5iWm4oR0KUfo1hro0zwQL+gE0+7YbAddakrkM5HKQVYA0EIxE1MugMhMfBIRAyZ6inkcPlSM7
 ssaiBfhdKFiuNQuDoHrkfNGfuYwsC5/QEFKAEGWLdwdAImHg1oUzDC6GmydG0tJY2w/+R8dh7YmTR
 gLpX1JRSoThbdpCr4nYWzfIM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mignB-005Cfu-Sl
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:44:49 +0000
Message-ID: <c9f318f3107253aba99f820e31734af1b5acb93a.camel@samba.org>
Subject: Re: Multiple idmap servers for failover
To: samba-technical <samba-technical@lists.samba.org>
Date: Thu, 04 Nov 2021 17:44:49 +0000
In-Reply-To: <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
References: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
 <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-11-04 at 17:35 +0000, Michael Starling wrote:
> 
> 
> From: samba-technical <samba-technical-bounces@lists.samba.org> on
> behalf of Rowland Penny via samba-technical <
> samba-technical@lists.samba.org>
> Sent: Thursday, November 4, 2021 1:26 PM
> To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
> Subject: Re: Multiple idmap servers for failover
>  
> On Thu, 2021-11-04 at 17:18 +0000, Michael Starling via samba-
> technical 
> wrote:
> > Hello.
> > 
> > I would like to specify multiple OpenLDAP server backends for the
> > ldap_url option. Is this possible as I don't see any examples
> showing
> > the format?
> > 
> 
> That could be because they rely on SMBv1 and Samba is trying to
> remove
> it.
> 
> Can I ask why you are not considering upgrading to Samba AD, it is
> extremely easy to have multiple DC's
> 
> Rowland
> 
> Hi Rowland.
> 
> This is a legacy installation and they aren't interested in
> upgrading.

Not saying it isn't possible, it will just be a lot harder and a lot
less secure.
> 
> So this is not possible?

Upgrading to AD will be easier and with the best will in the world,
whilst it has been said that the last version of Samba before SMBv1 is
removed will be maintained, most emphasis is likely to be on the newer
SMBv2 plus version.

As for the multiple ldap servers, this is something you would have to
take up your ldap server provider e.g. Openldap

Rowland
 


