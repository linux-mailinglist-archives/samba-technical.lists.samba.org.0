Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1AA1A1C05
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 08:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ltGCanYpOpEYq0++Sbav6TSNEx5pLjENiixBMri/R+w=; b=eld8JmIH0fXQW9QEuGXvs3p1wM
	XHS9m+TF5NPPBTz/UoHqOpwiUoW9O9du5ikYSVviH+Dn9rnSW0J+2Yap0eneQ8z3WGpbEJidmVDgp
	n132W/AnwQ40ggM2s5FVCRcrgy1Jfu8oNa7ROiXRGOfuWM/O0m/S0abyp1XpUteGPitb89uM2van7
	dvXxF8CuELy4HoUWZKuFHfCjqZS6iljTRf0RD1s/d1IGtHjrFWMju1ENPEkj8vDpKcN8Sddz96fno
	PPKetSIju1IfV2CfxdCkS6f+yqLjgIkuiQJTpmGbDYXA31U1ve86+m6DjtrUUBfU9KxR0xVV94s+M
	z22WqmMQ==;
Received: from localhost ([::1]:36432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jM4T2-0008aq-Jn; Wed, 08 Apr 2020 06:45:44 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9362
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jM4So-0008aj-G2
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 06:45:35 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0386WCL8030778
 for <samba-technical@lists.samba.org>; Wed, 8 Apr 2020 02:33:01 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920w1nec-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 08 Apr 2020 02:33:00 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Wed, 8 Apr 2020 07:32:35 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Apr 2020 07:32:32 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0386Wtwp28442796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 06:32:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16275AE053;
 Wed,  8 Apr 2020 06:32:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D58C9AE045;
 Wed,  8 Apr 2020 06:32:54 +0000 (GMT)
Received: from sig-9-145-186-178.de.ibm.com (unknown [9.145.186.178])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 06:32:54 +0000 (GMT)
Subject: tldap search paged
To: Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>,
 uri@samba.org, Ralph Boehme <slow@samba.org>, metze@samba.org
Date: Wed, 08 Apr 2020 08:32:50 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gvPXCVqC8Ys+EUIJXUTh"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20040806-4275-0000-0000-000003BBCF6A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040806-4276-0000-0000-000038D1326F
Message-Id: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
X-Warn: EHLO/HELO not verified: Remote host 148.163.158.5
 (mx0b-001b2d01.pphosted.com) incorrectly presented itself as
 mx0a-001b2d01.pphosted.com
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
From: swen via samba-technical <samba-technical@lists.samba.org>
Reply-To: swen@linux.ibm.com
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-gvPXCVqC8Ys+EUIJXUTh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uri, Jeremy, Ralph, Volker, Metze and others

I know you all have received enough emails about this subject already,
but I'd like to ask you one more time to revisit merge request 1258

https://gitlab.com/samba-team/samba/-/merge_requests/1258

I'm not sure if you all got informed about the comments / updates since
our last conversation round, therefore, I'm sending out this friendly
reminder :-)

As stated in the MR, I have updated the code according to your comments
and suggestions, including an abort mechanism for the async-callback
variant.=20
...and yes, for now, I threw out the _all-variant.

In order to re-start my work on winbindd_ldap, which is the "real"
project I'm working on, I need to have a stable foundation in the
tldap-area.

So please, if your time permits, have another look at the MR.

Thanks in advance for your support.

Cheers Swen.

--=-gvPXCVqC8Ys+EUIJXUTh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl6NcBIACgkQug2knLYP
YauQgA/+PNJoIauXrdnITFGc4fxZSW2MM2T7qpK6uPcb5i2JU3MiUzBs9WgVWibg
rdabbzO0h3QNQLMjDkUHD6cw1/XQ947wXj/A1VYRnDUo44iyNreNpSyGCa+adIk+
K4bmevzgz8C0JzgW9YJWa+vuouIKgu2uC6U4bThOdrivL1jtQplC+eObBiCQ4JJQ
cPCZk/ak6DIOsXSlVmxZv75OxjxEkOKpQMfyG6TX22ZW7I2/BwH3KS7CPqY7gOnf
t+FNZQnZI2LVfKm7gMQchrrhELnNKrjd6+RVgv0Wi3F8FDnvOHEeA7KBwxxS908k
SQOYd0w/xFxPqDhsMQd9BvS571U2kFnxwsjF5TG7WGn9rkaRhyyi53BnerNxcryN
nYmxSMfthgvBq04IFx2Z4GDwmtXzOX6aiYpXEke4N573iIk1kptkyUVjO/T0WOok
OsXBPjG/+wIsAz/hKBTHpBYHLprxYRhXCprTYUjWC4LwHcWRGuvxRczJnsJzfNWI
Rw2KtF941FzSMbx+bN/fwCHVQOeOJySgDZ+AkQlM6yCYkwgPNNHXsEy/HUPylGuK
3hoY3IHqiGZJ7IHfnwczzHX9PKigCuYZedYd8Rrzs7RRZ/zDaPsucawrUDrV1n5x
K44PVmJ2v9QpnOsIUtCIdPfNm/rmhdVLgzjIGEymQZTCPF3LSWg=
=jhzh
-----END PGP SIGNATURE-----

--=-gvPXCVqC8Ys+EUIJXUTh--


