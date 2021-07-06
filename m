Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 119573BC7B0
	for <lists+samba-technical@lfdr.de>; Tue,  6 Jul 2021 10:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=F1WdYUs5c4AVV0hVIlUiXO6m9ia6rGaxlFvRzeMlcaM=; b=SKWXbm3PdGxcGrA95rjM/cpB3A
	Bt+oYEt0P0A6of4qGsDsO3SsiB8NUnCf8KYdYngQifdVoC1UfJlrxVrBmxFOWqAs57FO9AZpjkac2
	J6otet/3MEzpJZSZfX4v7E+8zjECnKFaTtfnb3kndmiZ/y36znm1zO5MziNJhzzQDjMkGoG7EAgkX
	BkQx/bgAjgNbPISIO62HNDWqEVSVcnddgBreUSrIJP8KcgAOtU/pwpNOxYowMP9uOyGkBcYGeyD6C
	ScoOBE7uz4Ez+NPRxSvKtHrFYzkEf0UW0QNQ0BnBOl/dK8ZTrJx2xN6J/k9GkyW/wS1HfZ4RPUOoy
	zHN00KTA==;
Received: from ip6-localhost ([::1]:49656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m0gDw-00CQqy-Nu; Tue, 06 Jul 2021 08:14:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0gDq-00CQpn-J4
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 08:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=F1WdYUs5c4AVV0hVIlUiXO6m9ia6rGaxlFvRzeMlcaM=; b=TP24u0UbswbvdEBbCElMYNdQu4
 UIBOySXXfowmsD5SJSlSZMN1Fy0MCngUGQG6Tzg8DdSuS9j/jnZwkd9sXQXw/TL9wEtzcmgNyUkNe
 cp6axaz+gPuWzcuIv4/+k1T0GEBTH9ZhHvx9jA1cfT6Uty7EavMFVi8J9Jc8fnl+ORNQQ5dpDB498
 yx44U5LdOwxTbV3lgvWA+n+dAwahBJejAsXkTm+KpcAWYj6nNpt4hseB4VCggg5HYG38JZJg341Mu
 QDhn/5brYzE4tP3u2Sqk9Mi1D+4qAtIljOIDJgz1uXQJpobb5Vs2VST8nNcfN/9uuoj6JBpDhVI8j
 5c+55FfdTp4Ipu6Ih/iSNsiBRe8iTrBBklvFFc1XTuSr46cimVKvHl/ovTov0o50Zhyp0OHmI9Bn7
 h5vt3j/oV9ttokYze+H+tHn9fgW2CmqBPcGn7k2hyREdFug41mkYQcHofviUEKSzdoCJFJKCyLh0X
 Z9p1ZccbpN2jpIWRC/WEjJi3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0gDp-0003E1-I6; Tue, 06 Jul 2021 08:14:25 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
Message-ID: <c328766b-d894-517f-966c-fa5305558633@samba.org>
Date: Tue, 6 Jul 2021 10:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LSRJqnq3QQb4ryuGSylDv8Dp7EXUXNHtK"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LSRJqnq3QQb4ryuGSylDv8Dp7EXUXNHtK
Content-Type: multipart/mixed; boundary="VLjnCTRybyIjvq5SssPfnQelA9Mi4bt1k";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
Message-ID: <c328766b-d894-517f-966c-fa5305558633@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
In-Reply-To: <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>

--VLjnCTRybyIjvq5SssPfnQelA9Mi4bt1k
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi Andrew,

>> My current draft is up as a MR, and I'll continue to work to upstream
>> what I can (into Samba/Heimdal).  I do plan to upgrade Heimdal again
>> (perhaps to align to a release in 2021 if they make one) before I
>> finally merge the branch.
>>
>> https://gitlab.com/samba-team/samba/-/merge_requests/2014

Also keep the following in mind when proposing upstream changes:
- (kdc outdated passwords)
  https://gitlab.com/samba-team/samba/-/merge_requests/664
- S4U2Proxy requests with encrypted authorization-data are rejected by a =
Samba KDC
  https://bugzilla.samba.org/show_bug.cgi?id=3D13131
- The KDC logic arround msDs-supportedEncryptionTypes differs from Window=
s
  https://bugzilla.samba.org/show_bug.cgi?id=3D13135
- S4U2Proxy tickets from a Samba KDC don't pass PAC verification checks (=
authtime mismatch)
  https://bugzilla.samba.org/show_bug.cgi?id=3D13137
- PKINIT fixes:
  https://github.com/metze-samba/heimdal/tree/heimdal-smartcard

We most likely also need to change some apis in order to generate PAC Tic=
ket checksums
(Wireshark support is being added by Isaac and me, see https://gitlab.com=
/wireshark/wireshark/-/merge_requests/3570)
and also for compound identity PACs when offering FAST.
"wip: rework PAC and AD-SIGNTICKET for S4U2Proxy support"
https://github.com/heimdal/heimdal/pull/767
might also be related here.

I'll also try to start the discussion about
GSS_KRB5_CRED_NO_TRANSIT_CHECK_X again, see
https://github.com/heimdal/heimdal/pull/656
https://github.com/krb5/krb5/pull/1005

metze


--VLjnCTRybyIjvq5SssPfnQelA9Mi4bt1k--

--LSRJqnq3QQb4ryuGSylDv8Dp7EXUXNHtK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmDkENsACgkQDbX1YShp
vVbojA/4l0FIElJq+iW7s6vGFiHUjTWU5DnbF9+HTI425uuzDjn+13vyBs5nMVC2
uySbFWbf1YJDxvMcTS3bYR44AxwODmc2CwSQq+lSk6HuCLh1y7ZRoyjCGwTV3MgY
7sX1GdwnELVR43MFcFQ3t8S5JVGj0DfrdLwmllrtxqzHiLMOskThuuUToYd+iVaw
Eye7VXWgwa73iLE23ZhMXJ0YeEOCPcVeVfGBiebD4CzB9mnSqeqPNl+lwkYF74+B
DHAttWBGAY78gSFf3Vl3EjfyrwR3CaL2VmXX5C3kzz85D5WXqvY1xa2b/x5PMxQf
/4NkyPRHwGEO54EuI7rLlq5rINloGZzjdHqOy8obNiSbF05YsBzfpn1sZmce6Qqv
TJgF8mmN0+KBgZ7IhEt7q7NG3jaRQEk0iV/AXg744Ec/T7dEBXKGP28p45bSPg14
M3J45q1f2Mx/OGVyzeMnEytLz1hznLaIY93wWMhHgj3fmlzmvLQHxrjw6jKpEZA2
3/KLK5jqVXng4k6CayvfCZEa0VE2Mr0QtkEgXhScw00+k0l6aVSGzfiof9rGtZ/O
74SFGllw6bClQ0hU7puSxYN5Zf/dfwabAwsLNRxtYHeYn0IQqj+3oVkgrEf7rp3B
HBoFhuTf3k6uO/CRxXbbIzYJ96a3hqEb4NjyZWRNs4GhIT5gBA==
=7Uui
-----END PGP SIGNATURE-----

--LSRJqnq3QQb4ryuGSylDv8Dp7EXUXNHtK--

