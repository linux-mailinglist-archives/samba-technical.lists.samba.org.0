Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7919BE57
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 11:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QnD0f+/Vobdd6V5m38wYoWtr74Kix+6IRXacVKtgJ2U=; b=2FpSSJGwvPG3zgYrJ7TpM3U+Fu
	iz/+UZjSRp5uKtEdWopODo7tbhtkeMogbiHLRWjrHCcvhY2WLN5KQoLpSh8ElaD9vETtuFYdObIs7
	Ma2Ns5wkFVk4difqtqNovDFAdIq7fzdb4P+IixTBzZ8AxRJt3xujzGvJjucFRYKYSzYH3ZhXOu0i7
	poibGqovHbCD+prJTK9h2NnNSsVnkkkjURlPtIyfLF1MBvsJoZZDKlD51kgrNXN5YbQkKLyAplqGd
	Owrve+u9Y4hSjR0KWJ0PHZd1z52LHckY5ETHNpW5IKgadIMNXl1hCMqWCM/0uAJ8oUxj6WsB+zxte
	pmgkAnvQ==;
Received: from localhost ([::1]:61746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJvn0-0035d6-76; Thu, 02 Apr 2020 09:05:30 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56430) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jJvmv-0035cz-II
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 09:05:28 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03294QFp102163
 for <samba-technical@lists.samba.org>; Thu, 2 Apr 2020 05:05:21 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304swspv55-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Thu, 02 Apr 2020 05:05:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Thu, 2 Apr 2020 10:05:10 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 10:05:08 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03295FXl50200584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 09:05:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4076CA4057;
 Thu,  2 Apr 2020 09:05:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AF31A405B;
 Thu,  2 Apr 2020 09:05:15 +0000 (GMT)
Received: from sig-9-145-190-117.de.ibm.com (unknown [9.145.190.117])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 09:05:15 +0000 (GMT)
Subject: Extending tldap paged search
To: samba-technical <samba-technical@lists.samba.org>
Date: Thu, 02 Apr 2020 11:05:10 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8RerXina7HvziHIvzpAJ"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 20040209-0012-0000-0000-0000039CC8B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040209-0013-0000-0000-000021D9DB9A
Message-Id: <c21a3a0388963ca913be702d527c6989e29e8ab4.camel@linux.ibm.com>
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
Cc: Volker Lendecke <vl@samba.org>, metze@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-8RerXina7HvziHIvzpAJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I've created a small patch-set which is extending the current code for
paged searches in LDAP.

Unlike earlier versions of this "plan", I tried to be as minimal
invasive as possible and used existing routines wherever possible.

The "extension" coming with this patch-set includes
- a larger test in torture, demonstrating the the use of async paged search
- externalization of the tldap context's last_msg information
- sync wrapper to collect all search results in one go

The patch-set passed the test on gitlab and a MR is created at
https://gitlab.com/samba-team/samba/-/merge_requests/1258

Comments, feedback appreicated !

Thanks in advance for your support.

Cheers Swen

--=-8RerXina7HvziHIvzpAJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl6FqsYACgkQug2knLYP
Yav6lg/+Kyk9rrinoNsYSuWR7CVBMue03RJfH5lf/lLO9hXvMUE64s8Cb74skk6o
lJksya2bsAM19lWT7+rAHauUG3JCYxYMkFcglMoqcUQIg6IWvBwCTyKV4rQ6BTJj
OT+PfONQDAvb375LEam6JBmk5dc8i/dRHfSG4mMJNrRP76VBqjDhjzJSSdE4OmLJ
/SR0LTMgG2dcbRmcf3NN4yfE45Zco/19y04ZTBWVQfz40ditsWoZ4kgR94JYvqht
gSX7qKvGZDMx8shuhQPzTm0Npitkjdu7DdxsHTnm6Xb0W1PlIUCEl5ZNjTyhptse
fEvweEf471HjR1VbrkU1Fu0Aygh01B/nqasBndPGdh2BQUJIVlyXXOQn7k9j7xmP
fy6GGKPv7uC4cMfo/sHhSWGLbDHbJeX1anvtIgBi4T9Wm7SJhXvQZMzn2fgteuQo
HQpHZaWviOLts3ItErWx9p+DcqfH8hpMkVzmEonoEW7k+wStc2Ry/0jsoP2rKYwO
WTO1D2VkyxEW6dbLiiWs1H29kNqmYZcpWbxLFFOVfpPqGFFumnEqTifY+Tz/hDao
0RvBkpmUYT5Ikt4Jbpsw6JATrgRi0FABBaXpEQvprMDgn7ksUfgvLN12zwVNo4Xp
U6FNWhFkwqHhMrAlBXAjxAWTxXwrzMj12uEyFMC17onFbtieFVo=
=LnYW
-----END PGP SIGNATURE-----

--=-8RerXina7HvziHIvzpAJ--


