Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54B1E4E83
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=gCzaVS/udccbmePEfUARh9D0MTX3SmgOnSXQn4sWss8=; b=INsO4KEFS2bVM9ob45EBYH9xvP
	sSuJmiELflXr+Fmt1cGp3KJDLCAqWbGg99psi06vDrmSliISzGE3qLY7hAFCfT+ebbl863XEFirq9
	ckILbihk+L//qxkzuQH9vZZ5z9uejeqg8zHzMIilP4zCeyijc7y+okTXOsXvxzDMJRGYDJ3Yavnd9
	J1jVERkCWqAHG4VT1BRaabfSF4ZP3Udtq2e2V+swDZntX4ut9NdIYcq5BoSKR+zMjD6VP9/vT+xZy
	mMOT/ACA76HXA77wxU0RMcWvxghT7BRZVeYf0mYjBtvrNXyfySVvbSvtma+bdXdeI+RMeCDVzLMQL
	Nib1ahsA==;
Received: from localhost ([::1]:18904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je21T-0065Uq-Qx; Wed, 27 May 2020 19:47:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47814) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je21O-0065Ui-RC
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=gCzaVS/udccbmePEfUARh9D0MTX3SmgOnSXQn4sWss8=; b=em9drfAcPyOrqcZYYZ5ijU4hDN
 BAPhUxhYx2cAVkwRIdnluUu+6W1qGRVlc/EVl5Ak3DoGZedQMkvMV3YYiA+lxL9OE0NFtwAYEndCG
 6U0y3hVjzlDchFdW5veyjpphxsNR4QmMZcW+M7XnmjdIWFjykxZ2ceM2AJzSc893bXylXIT3vGWdS
 pbE7/5PsKIyPy5frrVwLWv5FrZ8A7/gFslaFt4V6822qkg3ynhFmWQUxDPBhnlIKPmmI8aVPVBSDq
 PCvdt4kM3xu2Iqmn1NEptqgdRWXO5nBSqzuVyVqtQDLc4+kLxoPDTuQofWNEv+fIiY8hIf/iNbF/l
 9XVKFVQwbMCrz3Uvw9DDQWSXfllPHZBIrRUPeqNefLn8r0Yr1vjUKUDbR3besBPEboApJUe9AFItk
 GyihbFFQvg2ebwrXi7odI2Dt/fZJLpeWRr2nMrzVlwUWj5PDBhaslmM5gW9byfBTDUNVDTD+/OjPP
 4ZzJSUZuxeGj7a7G9i2tcvx1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je21O-0002E3-Aw; Wed, 27 May 2020 19:47:26 +0000
Subject: Re: Kerberos features talk at sambaxp
To: Alexander Bokovoy <ab@samba.org>
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
 <20200527194425.GL5779@onega.vda.li>
Message-ID: <72637587-49b0-76b4-ab2e-81437fd03e1e@samba.org>
Date: Wed, 27 May 2020 21:47:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527194425.GL5779@onega.vda.li>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="n7XxEPW8FvqubwU6nsdfEtbNwDXJP7GRw"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n7XxEPW8FvqubwU6nsdfEtbNwDXJP7GRw
Content-Type: multipart/mixed; boundary="VFKU0YOkdJ07bZJfTLRt2KOpZdnr9HstN";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Alexander Bokovoy <ab@samba.org>
Cc: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <72637587-49b0-76b4-ab2e-81437fd03e1e@samba.org>
Subject: Re: Kerberos features talk at sambaxp
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
 <20200527194425.GL5779@onega.vda.li>
In-Reply-To: <20200527194425.GL5779@onega.vda.li>

--VFKU0YOkdJ07bZJfTLRt2KOpZdnr9HstN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 27.05.20 um 21:44 schrieb Alexander Bokovoy:
> On ke, 27 touko 2020, Stefan Metzmacher via samba-technical wrote:
>> Hi Isaac,
>>
>>> Thanks for the talk was great, can't wait for the slides :)
>>
>> Thanks! I'm sorry not to finish in time:-(
>>
>> I may be able to complete the recording to the end for the archives.
>>
>> StefanMetzmacher_sambaxp2020_Modern_Kerberos-rev0-compact.pdf
>> can be found under:
>>> https://www.samba.org/~metze/presentations/2020/SambaXP/
>>
>> Also checkout the latest wireshark!
>>> I don't recall a problem with the enterprise principals in old
>>> S4U2Self padata, but I mostly test MIT client, I'll give it a try.
>>
>> I'm also not 100% sure, but I thought you told me about it:-)
>>
>> I think the difference is also the client principal in the referral
>> tickets on the way back.
>=20
> As part of our work on server referrals in FreeIPA, Isaac and I made a
> tool that might be useful for these investigations:
>=20
> https://pagure.io/freeipa/raw/master/f/daemons/ipa-kdb/ipa-print-pac.c
>=20
> It uses GSSAPI and Samba's libndr to obtain tickets and print content o=
f
> a PAC. Obviously, it can be extended to print more ticket details if
> needed.
>=20
> It is able to acquire normal service tickets and S4U2Self ones, with
> enterprise principals or not. We use it in FreeIPA tests in-realm and
> for cross-realm operations.
>=20
> To compile it on something like Fedora you can use the following line:
>=20
> gcc -g -Wall -Werror -o print-pac -I/usr/include/samba-4.0 print-pac.c =
 -lgssapi_krb5 -lkrb5 -L/usr/lib64/samba -Wl,-rpath=3D/usr/lib64/samba -l=
ndr-samba4 -lndr-krb5pac -lndr  -ltalloc -lsamba-util -lpopt
>=20
> It is basically Samba libraries + Kerberos/GSSAPI + popt.
>=20
> If people are interested, I can submit it to Samba upstream as well.

Isn't that what 'net ads kerberos pac dump' already does?

metze



--VFKU0YOkdJ07bZJfTLRt2KOpZdnr9HstN--

--n7XxEPW8FvqubwU6nsdfEtbNwDXJP7GRw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7Ow8kACgkQDbX1YShp
vVYICRAAvP5BZLM5dMKyxfu89paJb26UeFv67ogrEnPC4GnX60Eaqh8dyGy5rgLp
3nfzhcm+oVId+GNnNUFNX85DkKZRHrB3aE4gk1WcU9JgDaet8DfOmItvH+Zj1wDd
77TF65IqW7Wqe5bA+60gDfVlQ2zG62uYJ6wVKFQLtMaQYoUMTBhA0N73Om0uW4of
fkhN8sL3K8dCl4Guk7CkoICpnrQgvIZG46hyZkoAepsehdzYlQ6SmjuG68CWOtGa
HuZbtOk+ydeKwvnRmF4OEb2h/d1fqc/Rh38T+wbSNi7tPjP8yIlSVMAmu9Vk+JLc
hN7cYyYV9uO1ayTS2WgXmdw4n7IrIrn5NxV1hlYyZwYUr8mdT898of5kpYd3b9Mq
Y7B5m/+CcZDLM13MFW4bOeooK+K2+fg2M3++VgrKQt2Y2w9hInPBdUe13FJ62lkX
0YLjiJvMFgxhfiRdGZH5wbdycSgMrd21CzrdrmjktfbomOT6nwFrl/O1KWMnQ7x1
ZEPxG3NS1IejTYWfN3OnAYz92/dabLjNJVbXbM6FC5FOoM9egF/Co2PZtKcBlX2G
Qdabowa+kTwOKbH66UBjblhkJmzmRxydpujy8Hyn66G1/3k9wrXA5+kzL0QHQr5S
7rhElq4x8bd2kxJOg31tl1gyUBnv5eHmVvEzwQsgkxFhHDVLCu8=
=jkk+
-----END PGP SIGNATURE-----

--n7XxEPW8FvqubwU6nsdfEtbNwDXJP7GRw--

