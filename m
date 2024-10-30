Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD049B6C89
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 20:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cz9BxzuW/0DPEH5dUVNi2p5YHONWeNZEHc7Be5PNBaA=; b=WYw8GnzYrkfeDwbbyU7TW1I1Re
	hvsqW7sTQovTA/qOoL1acHBa506uUFZwwMu+XKmKOf2ewRqD8ME3Q+Sim4HY7C3gcqsvlMD+vXack
	Nd6CykLVxZoVgOUCuGPXX2kH09Fl7JfTrr/bQ3w4p2VcEorviDPe3SJy5bdRg+s43vhfRXuntKXB5
	tCkT2jXt4agqSwma6PflmEVj9zLOoUCcVY0x9FjIeXdCHbRcKk9f0qE5Z6DE8UFzK5yg1NVv1p/Aq
	oMr9jQq19RzPodUaEq6O/owLHE71NfjQv7CljPs89nGAWmHqekPM8DGHlfZVLAzZOznSVI5wWAhrG
	3+AGS/5g==;
Received: from ip6-localhost ([::1]:39236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6DxN-005bmF-Oe; Wed, 30 Oct 2024 19:02:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43582) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6DxI-005bm8-Uw
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 19:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=cz9BxzuW/0DPEH5dUVNi2p5YHONWeNZEHc7Be5PNBaA=; b=gekYKlOE9/IJq12KCwx+ztaOhS
 hhwEQkcuLXA1iqZcrtsJzQkB3FBO5tJQl0PKQYKsBOBDZdl+jXbWsPTjD+lp/ncfAiDu1y+YyNBTi
 d7EXTptWIW1Bdz6Wgm+ANT1su149+kCzkEi5F0Kko05z3HL+SPx7E97aV7CxMTYIHBBKofjqWU7gD
 UV4VWNHfrMCL5dN/ip9obnXABlQG6iWGE53WDF/VQ2lSN+OtpdR52bxIVdzu/pMVChnidbuXiPE59
 W5zBZ2Tk/qMZO6ksiIE6f4U5WqdEqSSvhBdXdHDidh1wAAANqMaPLyWMHH2BLTO7w+n5lAggKcG/N
 yBn/oIOWhZC5CegCC2G0v5a8PYoNbThRe2sd8mILbReTD6H4BQSVZhc/uJY+dpe0f4DBqhsn8N0zO
 s/WHIuA2QEYWovau10xzKFCk13mdKBaPHzYVLaFRdjMbmKIhjyV6VG9i0/t5pz6STm7xasUDUA9Sg
 Z1G4Rj58SF4NUruqYv1oVgcT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6DxI-008Nvh-0V for samba-technical@lists.samba.org;
 Wed, 30 Oct 2024 19:02:08 +0000
Date: Wed, 30 Oct 2024 19:02:06 +0000
To: samba-technical@lists.samba.org
Subject: Re: authentication policies in Samba 4.21
Message-ID: <20241030190206.65d2416c@devstation.samdom.example.com>
In-Reply-To: <5b45562a-4bc5-4adb-9f75-d3c91a08d719@kania-online.de>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <20241030171507.5d092646@devstation.samdom.example.com>
 <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
 <20241030183355.6de5092a@devstation.samdom.example.com>
 <5b45562a-4bc5-4adb-9f75-d3c91a08d719@kania-online.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Reply-To: "samba@lists.samba.org" <samba@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 30 Oct 2024 19:56:08 +0100
Stefan Kania via samba-technical <samba-technical@lists.samba.org>
wrote:

> 
> 
> Am 30.10.24 um 19:33 schrieb Rowland Penny via samba-technical:
> > On Wed, 30 Oct 2024 19:16:53 +0100
> > Stefan Kania via samba-technical <samba-technical@lists.samba.org>
> > wrote:
> > 
> >>
> >> Am 30.10.24 um 18:15 schrieb Rowland Penny via samba-technical:
> >>> Try adding '--show-binary' to the ldbsearch command
> >>
> >> No, I only get an empty string. I think the problem is, that the
> >> binary is converted to base64 if listed with ldbsearch.
> >>
> >> root@debclient:~# ldbsearch -H ldap://win2022.winexample.net
> >> 'CN=win11-policy' --cross-ncs  msDS-UserAllowedToAuthenticateTo  -U
> >> administrator --show-binary
> >> Password for [WINEXAMPLE\administrator]:
> >> # record 1
> >> dn: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy
> >> Configuration,CN=Services,CN=Configuration,DC=winexample,DC=net
> >> msDS-UserAllowedToAuthenticateTo:
> >>    
> >>
> >>
> >> # returned 1 records
> >> # 1 entries
> >> # 0 referrals
> >>
> >> Stefan
> >>
> >>
> >>
> > 
> > Strange, it works for myself, example:
> > 
> > sudo ldbsearch -H /var/lib/samba/private/sam.ldb -b
> > "DC=ForestDnsZones,dc=samdom,dc=example,dc=com" -s sub
> > '(objectclass=*)'
> > 
> > Produces
> > 
> > ...............
> > # record 19
> > dn:
> > DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=MicrosoftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com
> > objectClass: top objectClass: dnsNode
> > instanceType: 4
> > whenCreated: 20220910074319.0Z
> > uSNCreated: 5515
> > showInAdvancedViewOnly: TRUE
> > name: _kerberos._tcp.dc
> > objectGUID: 4cc3e13a-cee2-46c3-868f-459eccb43ecc
> > objectCategory:
> > CN=Dns-Node,CN=Schema,CN=Configuration,DC=samdom,DC=example,DC =com
> > dc: _kerberos._tcp.dc
> > dnsRecord::
> > IwAhAAXwAABuAAAAAAADhAAAAAAAAAAAAAAAZABYGwQGcnBpZGMyBnNhbWRvbQdleG
> > FtcGxlA2NvbQA= dnsRecord::
> > IwAhAAXwAABuAAAAAAADhAAAAAAAAAAAAAAAZABYGwQGcnBpZGMxBnNhbWRvbQdleG
> > FtcGxlA2NvbQA= dnsRecord::
> > IwAhAAXwAABtAAAAAAADhAAAAAAAAAAAAAAAZABYGwQGdG1wZGMxBnNhbWRvbQdleG
> > FtcGxlA2NvbQA= whenChanged: 20231019102846.0Z
> > uSNChanged: 5618
> > distinguishedName:
> > DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=Micros
> > oftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com
> > 
> > But:
> > 
> > sudo ldbsearch --show-binary -H /var/lib/samba/private/sam.ldb -b
> > "DC=ForestDnsZones,dc=samdom,dc=example,dc=com" -s sub
> > '(objectclass=*)'
> > 
> > Produces
> > 
> > # record 19
> > dn:
> > DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=MicrosoftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com
> > objectClass: top objectClass: dnsNode
> > instanceType: 4
> > whenCreated: 20220910074319.0Z
> > uSNCreated: 5515
> > showInAdvancedViewOnly: TRUE
> > name: _kerberos._tcp.dc
> > objectGUID: 4cc3e13a-cee2-46c3-868f-459eccb43ecc
> > objectCategory:
> > CN=Dns-Node,CN=Schema,CN=Configuration,DC=samdom,DC=example,DC=com
> > dc: _kerberos._tcp.dc dnsRecord:     NDR: struct
> > dnsp_DnssrvRpcRecord wDataLength              : 0x0023 (35)
> >          wType                    : DNS_TYPE_SRV (33)
> >          version                  : 0x05 (5)
> >          rank                     : DNS_RANK_ZONE (240)
> >          flags                    : 0x0000 (0)
> >          dwSerial                 : 0x0000006e (110)
> >          dwTtlSeconds             : 0x00000384 (900)
> >          dwReserved               : 0x00000000 (0)
> >          dwTimeStamp              : 0x00000000 (0)
> >          data                     : union dnsRecordData(case 33)
> >          srv: struct dnsp_srv
> >              wPriority                : 0x0000 (0)
> >              wWeight                  : 0x0064 (100)
> >              wPort                    : 0x0058 (88)
> >              nameTarget               : rpidc2.samdom.example.com
> > 
> > dnsRecord:     NDR: struct dnsp_DnssrvRpcRecord
> >          wDataLength              : 0x0023 (35)
> >          wType                    : DNS_TYPE_SRV (33)
> >          version                  : 0x05 (5)
> >          rank                     : DNS_RANK_ZONE (240)
> >          flags                    : 0x0000 (0)
> >          dwSerial                 : 0x0000006e (110)
> >          dwTtlSeconds             : 0x00000384 (900)
> >          dwReserved               : 0x00000000 (0)
> >          dwTimeStamp              : 0x00000000 (0)
> >          data                     : union dnsRecordData(case 33)
> >          srv: struct dnsp_srv
> >              wPriority                : 0x0000 (0)
> >              wWeight                  : 0x0064 (100)
> >              wPort                    : 0x0058 (88)
> >              nameTarget               : rpidc1.samdom.example.com
> > 
> > dnsRecord:     NDR: struct dnsp_DnssrvRpcRecord
> >          wDataLength              : 0x0023 (35)
> >          wType                    : DNS_TYPE_SRV (33)
> >          version                  : 0x05 (5)
> >          rank                     : DNS_RANK_ZONE (240)
> >          flags                    : 0x0000 (0)
> >          dwSerial                 : 0x0000006d (109)
> >          dwTtlSeconds             : 0x00000384 (900)
> >          dwReserved               : 0x00000000 (0)
> >          dwTimeStamp              : 0x00000000 (0)
> >          data                     : union dnsRecordData(case 33)
> >          srv: struct dnsp_srv
> >              wPriority                : 0x0000 (0)
> >              wWeight                  : 0x0064 (100)
> >              wPort                    : 0x0058 (88)
> >              nameTarget               : tmpdc1.samdom.example.com
> > 
> > whenChanged: 20231019102846.0Z
> > uSNChanged: 5618
> > distinguishedName:
> > DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=MicrosoftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com
> > 
> > Not the same search, but it does expand '::' attributes.
> 
> Yes, that is working (in both Microsoft-AD and Samba-AD) but not for
> the Attribtute msDS-UserAllowedToAuthenticateTo. Either searching in
> a samba-AD or a Microsoft-AD. I tried "nettools" a tool to search the 
> Microsoft AD Ldap and see all attributes with the value, but the 
> attribute msDS-UserAllowedToAuthenticateTo is empty :-( only
> ldbsearch is giving the value but not as readable SDDL-String. In a
> samba-AD I use samba-tool to read it but I can't use samba-tool in a
> Microsoft AD. The only way, I think, will work is adding a samba-DC
> to my Microsoft-AD.
> 

If '--show-binary' expands some '::' attributes but not others, then I
think you have found a bug.

As for samba-tool, have you tried it against Microsoft AD ?

Rowland


