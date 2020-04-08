Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 004051A25BE
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 17:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zD1hl8RZYmvfS3hrTNff6NacVH1KNcppn0v45/DqwBo=; b=vzRxEz1VS3LLVAPCE79ybHGuDs
	0rIzFogkzDgeRxocLf1P8JkIusSGiPtYv6Ca2YBrGBvH/eqQLIH1ix7VMtENyxrREIRB7yQ8yjz0E
	hbR/PRTk5+t291I1CPAnG946rM38WMvSLp/8p1meVududeEsHnVJfKGuhuoyu4JV3wdDT+s5LSynK
	FR5/TE2nv/Ub0DJQoAoferZHkLtx3/cHgU5Lvavlc3SQBQajQncPFkw+E5jZoD+331LdWf69rz+2h
	cfuwWpd+2s2VIwS7N7jvcI7yy5gq/Sh+1CFxvimLPzS8PK5XB6WCER+7yOpHuGJxuzuoheOnMK0RG
	HmGJsx1g==;
Received: from localhost ([::1]:52658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMCrf-000BGY-Gy; Wed, 08 Apr 2020 15:43:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMCrb-000BGR-7A
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 15:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=zD1hl8RZYmvfS3hrTNff6NacVH1KNcppn0v45/DqwBo=; b=SEzMXC4mR9nBD230FjH1kFEDam
 NRSd27sfZgwUtfb77934FXg/h+heEhV8iyApv9ISYC4yTSLLWsPDzNxigt2swqt0r12TI+raBTzf+
 QyiORejM+5kZ0pEinC9YPpOED/b2eeJcO2+YdudQF56XhWwel5ADsBjUudArJu8dc7L/zUPqv6Cxw
 YNlF0DB/OJAd6UQJYdvf/L/aO5kiEhEZlt1VPO/hdg+7qll3T+TRFsTxfYV/+gm5lopHrexeZ6Ubk
 VBRShNsNXRfvETaFHq0plu0k4n7Z0x18uVH6hJ55KAVr+lZ3FKJccmAY7NNdGLaqlG7n7IZ5cet/R
 pYzkMuI/TqXc9de0w/HCx1LamDqRHbXWjM3ZXjvkHJ+P7OYP4FFNJ3552sSqeBI9y/IgHApX7gKDA
 N/sZ7D2mO9P4yhEnt3kdBeikCdD5V4dCLMhjj+oWoK24YN0sLD41huUjYHSYkCxG0lqGh/g8GzUC1
 90XMcsMDNrPp6XNUxWoKfIPX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMCra-0007vE-Ls; Wed, 08 Apr 2020 15:43:38 +0000
To: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
References: <a3921636-89bb-e184-1dc5-fd8d224b55fe@samba.org>
Subject: Re: Linux Mint 4.15 Kernel and NTLMv2 account lockout with empty
 string password.
Message-ID: <8a20b2d6-024e-dbbe-831f-dafed62c001b@samba.org>
Date: Wed, 8 Apr 2020 17:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a3921636-89bb-e184-1dc5-fd8d224b55fe@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="H7MGSL0RkiV1CaRyadSO3duzOkZZK3QUH"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--H7MGSL0RkiV1CaRyadSO3duzOkZZK3QUH
Content-Type: multipart/mixed; boundary="dluj9EuiXW1iBGhj1vMIy66IU0FQY8zYz";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <8a20b2d6-024e-dbbe-831f-dafed62c001b@samba.org>
Subject: Re: Linux Mint 4.15 Kernel and NTLMv2 account lockout with empty
 string password.
References: <a3921636-89bb-e184-1dc5-fd8d224b55fe@samba.org>
In-Reply-To: <a3921636-89bb-e184-1dc5-fd8d224b55fe@samba.org>

--dluj9EuiXW1iBGhj1vMIy66IU0FQY8zYz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 20.03.20 um 11:19 schrieb Stefan Metzmacher:
> Hi,
>=20
> I recently noticed the following problem with a 4.15 Kernel
> on Linux Mint:
>=20
> /etc/fstab has something like this:
>=20
>> //172.31.9.132/share1           /media/cifs/share1      cifs vers=3D1.=
0,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
>> //172.31.9.132/share2           /media/cifs/share2      cifs vers=3D1.=
0,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
>> //172.31.9.132/share3           /media/cifs/share3      cifs vers=3D1.=
0,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
>> //172.31.9.132/share4           /media/cifs/share4      cifs vers=3D1.=
0,credentials=3D/media/cifs/cifsmount.creds.txt 0 1
>=20
> 172.31.9.132 is a Windows Server in a Domain with Samba AD-DCs.
>=20
> The initial mounting works fine, but after some time Samba
> logs WRONG_PASSWORD and finally ACCOUNT_LOCKED_OUT.
>=20
> From various clients this happens about once per hour!
>=20
> In order to debug this I extended wireshark.
> wireshark was already able to decrypt NTLMSSP encryption
> when an NTLMSSP password and/or a keytab is provided.
> I extended that in order add some useful expert info
> that shows which NTHASH was used for a given authentication.
> That is also available with an Schannel encrypted Netr_LogonSamLogon*
> call. This landed in wiresharks master branch a few days ago.
>=20
> The customers capture didn't show that information,
> which meant that the client used a wrong password
> when it got LOGON_FAILURE from the Windows fileserver
> (because that got WRONG_PASSWORD or ACCOUNT_LOCKED_OUT
> from the AD-DC).
>=20
> I cross checked that with smbclient and there wireshark
> showed the correct password was used.
>=20
> This is very strange and I had the idea to just check
> if maybe an empty string password was used by the client.
> So I created a keytab with the NTHASH of an empty string.
> And wireshark showed that this NTHASH was actually used...
>=20
> Has anybody seen this before? We'll retry this with a newer
> kernel next week...

I was able to capture that in more detail
and it's actually not a problem with cifs.ko.

The dialects in the SMB Negprot request contain "Samba", so
the problem is triggered by some [lib]smbclient user, maybe it's gvfs
related. I hope to find more in the next days.

The bahavior was seen with Samba 4.3.* and 4.7.* where 4.7 sends an
empty NTLM response instead of using the nthash of an empty string.

metze


--dluj9EuiXW1iBGhj1vMIy66IU0FQY8zYz--

--H7MGSL0RkiV1CaRyadSO3duzOkZZK3QUH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6N8SIACgkQDbX1YShp
vVarCw/8Cjd7x9dDfY2YTq+BFP0wbs3Dcb3t/FDesfzhPHlzHp6h1W4SFfqWwCq8
6m86QJAwvYos1CV3vJRKj6I7Pj4fn6bxJ0QuedJR3X58SFucjs6xmeWSlhu0I6nG
bjxE1ZnvDNkZmosbQBBoC7DJ7OI48Dkzz0QY1Oc8FEts/+pPb4qGZd6ak3eT5XQX
CEDmRt0O9iVVZ/+Zc1Rng7LmUMzCljR7gkMdtT1tOeiuW6DJoW20i15HyQGWNGzA
2HY+Br/4b41484Nh7Qcmv3uTcFKrgv/eUqfInbhV+okccN1LL39NbiPRZBVhXu/n
Vj0lRSivtslJ0y3Uj0ZuVwufndz/HIVX53W2Hp3IAZ+GhOsUiP/WMfLvLQgkWygL
Juo8tcA0AhhoSscFslt8NNu8G6DluHx0p+QEf7PtCy3LUC1cV78uQx8DNF57FFJ9
W97dthFUTuluq9IW35TVt1F6SG8/z5443nk+ltZPh8zD9/qvIYkZpunyV7dShZ3r
8gmXz2Ty5tGxX5+ohTlOSbZ5cBj62qo8h7p7AUl8JOWo2xMVD+kcG86VKqr2TaSL
26nMQhL0yNvvFrfAP4JgDJ1O40f1hCcm9ZD3/OGhNNlx/tXP7EJ0afP2U3MH4Fyd
GqJv8arkFt5iIwYXwL2VuisjT19lPN8Zu7fPxdXHpaTFVRDTKCw=
=pqTX
-----END PGP SIGNATURE-----

--H7MGSL0RkiV1CaRyadSO3duzOkZZK3QUH--

