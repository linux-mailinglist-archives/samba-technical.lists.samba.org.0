Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B529FDD1
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 07:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/7DHxrrt7J/kUAIbLo2eO+gqxVDx9CMuPcsHvMSWeGg=; b=5F9ppl/7rwify+bbfInZSo9+K0
	teAlkUo6/5I/DZmfgHNvYO5CwygW0DuxOaqB+23OiqihmgF63UUk6w/2Mf/ANDXl+lHGUoLM7G7A1
	jEkhc2mIHCpl/t0mP2wU1gngoglb5a9SA7i7o8A9W8RVNHQI9ZFb765A6MewFOp3xLZ9hUaCTXp2s
	HiSreCJGbUPiyu7pmnUQbe+4JyT23n8NaashedTsl4luKqOlEaCqOhXFUSSVap4FSJSxe6snrrfjW
	Xjw5Cjnjknw8Q/7UPyeYlCQDns7Ajsm5FAROUFyk4KboJBDQBArHdgo9tMfPuah7gh9nUAr+PKtlr
	GLoo3v+g==;
Received: from ip6-localhost ([::1]:49204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYNw0-00EaFR-2p; Fri, 30 Oct 2020 06:30:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYNvd-00EaFJ-4g
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 06:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=/7DHxrrt7J/kUAIbLo2eO+gqxVDx9CMuPcsHvMSWeGg=; b=St0+4tS6esa2+3oV81KunbV93V
 AJ0z4pah/fW4iKPlVyNN7WLkZf2HQhNMfZSHMl7NQgJ5LM8rK4QxNoBGbT5iqKmpNQoKkMPyXfGHH
 egPKO0OoWmhX4M6K9ECrhyU9AXysBhh8BZU4jl+/85SYrQMzN+HQUtevfBtWa+hxW4L4jlrYciHeR
 5EBWfwTuin10KUasDNxO5n79sic8eIVVmdr/vS+vPyLluwH2M/No9/dLLFnhlgdcN89gFIyJvkVgI
 Iqw/UDGisLCPGnzOPb/0ZZ6UWoq+e6THi+NTEqxmywMTBpbD9Sy/jCLPbRMxifEOqjDTyXx5lwLWy
 WvbqxwNyIqoWT8g54r/Qb9ikdofdctJ8wNF7Hy4Gqq6zMJSYKDv3ZF6EtESc7aPeUSKrYKFYv1Lxf
 2CB+hsl2HtwZsD48DQmOxT1HEMvO1bKIFld6xqCwKUdSVmHTylvMpgdELKeF55W6DG9xezP/YeTes
 0LjbIrpA3e/uhflxwByvACZY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYNvW-0006wr-Su; Fri, 30 Oct 2020 06:30:19 +0000
Subject: Re: can't start smbd after install samba posix branch
To: Xiaoli Feng <xifeng@redhat.com>, ronnie sahlberg <ronniesahlberg@gmail.com>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
Message-ID: <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
Date: Fri, 30 Oct 2020 07:30:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fsaRci1PfgsJ9Fwl3frdLcSTzCKOBuXtA"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org, belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fsaRci1PfgsJ9Fwl3frdLcSTzCKOBuXtA
Content-Type: multipart/mixed; boundary="2ICrsfhrOWAcvm0jrDWpJqrD9HKrbwWqa"

--2ICrsfhrOWAcvm0jrDWpJqrD9HKrbwWqa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
> There isn't error log output. Just know the exit code is 1.
>=20
> # smbd -D -d 10
try

# smbd -iF -d 10

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--2ICrsfhrOWAcvm0jrDWpJqrD9HKrbwWqa--

--fsaRci1PfgsJ9Fwl3frdLcSTzCKOBuXtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+bsvgACgkQqh6bcSY5
nkaDqw/+KoY14y7MGm/gc0KyrIsCsNBfu+LxwchMicquQaXHHCztCGpB5kHRSjis
U0r9QaJxbg8JeBTOKsoZ3FM92MH07+Y4miml9gDvrjRSIx/NoII3ycJjuh6g3yAa
21+NfZQnK1n0QsalohE9wEapTFIbNUqiFsKGbeuuqJ6JyB/3+Sw3smfqBNhqvoXR
jvJGT/L4U26wteJ/jSMwCegRskx7BrFNdphwx4s3yuOJtVN5Qr8QfpQaToAU/ihJ
2XZ+gye113VN2bza+Dc5JXdi6f8z3Cs+cuXriMiVg7r/wXUsY1Qe+NSR8+y4JCvS
3qRfjabMDwqv1GJ+VKSmPH3kR9d3kihi76NXSnE/ywfVP12hGGbYOyt/CCZPs1p8
H/J+dyXoR0VfRAop6c0E+LPIQDtLbzp/pGCLQlM9jdkwvrLUl7UWpSIKcVGyuNFQ
Pe9kMSG0INvR5JGT79wKdjvK/z+6J7XQ9ZFTasYnoXu6e05J2edbqJeQC3jmdsTn
KbxGUuiqCFo5gRsmt9obYE/aafFJRuqdLayIeKUzM5TU2IkVCIDwNvpxvQRQso3P
ZIohx3MyPMJeFBiz6OsWWmVXaZ68myYUq5PlNfvVteW1YWRUm6FS/3zaHON8TZuW
3ATszRFk0SSJ8OFcKuEl8ZYMLCGTyLvjnLxc2zF8ED/b3dFCals=
=6Fb/
-----END PGP SIGNATURE-----

--fsaRci1PfgsJ9Fwl3frdLcSTzCKOBuXtA--

