Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA226DF1A8
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 12:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=74JyECowa34C+JVEp/NHdQ34jC9XFGFNB74bruDWsdI=; b=WTrcPC37BsvUVRpW/R9XxesY5N
	hI6HDs1Rs0AwVk+Ym5ea3/2BKVq8RVvg08cvohjCI373xmC/MY4s8u3fVKdvA1KULB5gARC9vGHQt
	TO4u81/vyHBThS4yYEtQK3bSARqo0lEIFl95io5JkbuN231USnJ200Q7pS51kohqpOHV2uo285O55
	+1Lw7Wg/G3GbkXRiqx346DNMMZhlX3gOz+YSX8uJw7GeHUhpXr1jjYTEO4uzqmB2tsXU5f5OJlsNg
	ZYbkxHT8+VdS/n/OLwUbeguaez0AZr8HFG/7r54jpOykQxiBpA38TGDbmsBKYHlodvW3EsxToOpDn
	G5aEFKKg==;
Received: from ip6-localhost ([::1]:27808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmXOu-000dfk-Ep; Wed, 12 Apr 2023 10:08:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmXOp-000dfb-OB
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 10:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=74JyECowa34C+JVEp/NHdQ34jC9XFGFNB74bruDWsdI=; b=YOEueuWZAi7j3AOGUGzDgYOK8e
 GrWYkTFvVd08e245Qy5rGODdrCWvEULjYXAXZCc+ZTGt/AOF0meEsSQfkFEoyjldfXcZTH0Arktri
 j5sTpkpkF33F/Z1lPgpbgcI0ZSrFiyzbPnDfrFAL72m3oQmQ5M03s2QWRQOMVzRWZowtEO/bk0+Qa
 VHYsz+Ulue1sw0q0egbczJJ4NCZYCB0l01zZs84jMycMzL7ZuEAoP2ZXf9Fdlhaz3/UQUbQuFy20q
 XcfCX9GsAIYSEvQfqyhkxK82Q/mav6hkqGK5lNG84nRV23wYD7O+5Ren9K3iQcQjjeWAx9AYPCeMz
 9xyq/lGN+I+xlscCU501HdWnC3TbMwfQ6LQh1wks1fb84RNZXFcvtGwIV3EX8V4dYpxEnxasbQrIn
 AMJhti0nJWxNljo2tEgzvPWy9QP/T9j/h+3ll95SlS2PnBRaEEcB2Lta8GAymXguPtm6zQYNKI0gB
 qCdGRk5dUgRncdSFZXZ3OJYR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmXOp-000gLH-68
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 10:08:23 +0000
Message-ID: <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
Date: Wed, 12 Apr 2023 11:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
In-Reply-To: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 12/04/2023 10:58, Jan Andersen via samba-technical wrote:
> I have an openLDAP service running on a debian 11 system, and Samba 4.13 
> on another Debian 11. In smb.conf I have set up the following:
> 
>    # LDAP Settings
>    passdb backend = ldapsam:ldap://vogon.zombie.io
>    ldap suffix = dc=zombie,dc=io
>    ldap user suffix = ou=people
>    ldap group suffix = ou=groups
>    ldap machine suffix = ou=computers
>    ldap idmap suffix = ou=Idmap
>    ldap admin dn = cn=admin,dc=zombie,dc=io
>    ldap ssl = start tls
>    ldap passwd sync = yes
> 
> I have some trouble understanding why this doesn't appear to work, and I 
> would like to try to understand how these parameters map to the 
> parameters of, say, ldapsearch, so I can see if the problem lies there.
> 
> I have run smbd with max debugging, and as far as I can see, it 
> successfully makes contact with the LDAP server, but then doesn't find 
> the user I'm trying to log in with. However, when I do a search with 
> ldapsearch, like this:
> 
> ldapsearch -v -b "dc=zombie,dc=io" -H ldaps://vogon.zombie.io -D 
> "cn=admin,dc=zombie,dc=io" -W
> 
> - I find the user in the output. So, my question is, which ldapsearch 
> command would be equivalent to what smbd is doing?
> 

It will probably help if you can supply logs showing Samba failing.
Also showing us your complete smb.conf will help.

Do you have 'server min protocol = NT1' set in your smb.conf ?

Are you also aware that Samba is actively working on removing SMBv1 
(which a PDC requires) and that several of the attributes required are 
now turned off by default ?
see here:
https://wiki.samba.org/index.php/Samba_4.13_Features_added/changed#smb.conf_changes

Rowland

