Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA01B720E
	for <lists+samba-technical@lfdr.de>; Fri, 24 Apr 2020 12:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3909qU+kh1Ub1HerUhx7rk3znR7VX6Wy6EGrGFCg5RY=; b=uYlkg4gzEP6lwyWK1p+w5ORYxR
	L9WdtKL/cEw+VvoDW2dLsNaJBSTutfs9L1m6aCtmiWZMgg1KhudDAZLCInVC4c9B3fDdA05AcGhT9
	BtvpJeBe5YpnRf0Z2WSgSDBR9q9N9cCjEh/3gFQ7xNxGeunsDChT9Tzb96uWdprg3IR6th3bNZn2J
	HW2ha+EfQSGUwuRmt7uezmg4GlmyZ9bchLtWAtY6uT7Z5xkUCGK7u3mlykpaPs+b/yq/1Aq3l3ras
	k36iZhsi22tKVUigqIQ+B/e6xxE3oaPaChN2zwqT8POzFElpUONY6o1Y1p4bjXJtChqVdr22M244N
	/e8eJdoA==;
Received: from localhost ([::1]:46876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jRvcw-001rPm-1T; Fri, 24 Apr 2020 10:32:10 +0000
Received: from sonic314-19.consmr.mail.ir2.yahoo.com ([77.238.177.145]:46469) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1jRvcp-001rPf-II
 for samba-technical@lists.samba.org; Fri, 24 Apr 2020 10:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1587724318; bh=UCpvz71ziKDQS3H7IAqeuPSG3i7kHgOEezFU0pzSlY8=;
 h=Subject:To:References:From:Date:In-Reply-To:From:Subject;
 b=ODNWmbTsZUX/7BHCURPYYi4W0rFpQHFX0X9xl/4lqYAtre+HW7UeVDlJ1TwwV66FGNPZKLmRGODu7wuxXkcrUgYp8ynG+FIRxRfu/xFoAzBpquKJeJxfdcrMcDCOnRjzR1VQBHSsQ5xjScotYxs/uniS+mRRRPs/xumRNylAhGOze/5XHVXMGrmaZXWbcAcY9RRGKHEU6RAgpAMFCEiTwPMkNy9oGqX4Z94+QkkhWfTAVdsYly7BeMAHw3aFNt/AWlVligglBk6P/2Oh39QbFSSo0tHYmNZ10nFMq08lUBcIjxB/yOUx6DhVL1UdYOwYDDksNhrN0B2gQa3N/nxBXw==
X-YMail-OSG: D_iHWecVM1l3AhhAE_ic4p2.9nPcfXHO0UPAIHKO3j5n0DCpEiYpH58mi9rX9Bg
 q.qXUG5Xaqs34T.j5VCMc.Egly9f0iHto4V6VvR_..7xmvD_0I0TTHR2X2uAq6CWOBKfdwIb3HoD
 U3fyvbrPZWhyLjCvN.Q7rwWTI5Vrmo_kZ6XrmVTxMQmkODK1kWzWRY2vlge59JUU7abU5RZN5idm
 ZuDFHuc52ympO_8.t5JPL7bi.6TtLRWS4aDHi82DJnE3YVDJWKZcS_2BbVtTofkE.xv9k5rBi34G
 VKVVZxbuozKXVYq.C8ddxWOryjpP.zq3hc6pNz51f58uifb86v2WPHrwtZuXLMNoxLMqNDIzeQvX
 yw0FJqCN45qkHWQE9mi8x6bjuAUrPidKHCDzVeov8BNrdw78joG7Rka_9vohlTcM3rshAQDozefX
 msLmtl7mKUKtYLQCAPklV_3dtuMra0vS8pFnJYThIL80sO0UiDBb.8I1qICVzCZg3R4E214UR0Gi
 DKjhyGIAL59i0Z.KpBCrRtHqbkiav90Ao6M8.OSBx4vM5THHZlzokGtikRzj2KuBVl1gdCFHg75t
 LxorZcJ2tUVCa2roiqJKI5.g.4gBzFhDSco.8O2Z3CMX0Fr6uM_kdkiPOTQF5Hd5Ds_8q9sCsvyP
 gyCvI30Xa1znKVZHKLMctFrcglKh47qAvDmFrKiCW08u4fySPKAt4EpJTwuX99IX0acnKoTIrDAS
 p4RiqGp3DB13cwA2lTzd6JIc_ikYfsDaSWuxLHUu6p4gqtUlwjMAfn0GJu0yxQRWSa1LK5ltoI8J
 BrGrWYtl2MU5yuKVkDprgneNdHnRorZat0AWL0SSm2PVlpQ_dmNft.gLUDAbj_T2GtorDKMbQRlC
 8MGj9oqLu4.bdMJrRtENADYz8evT8uvgSFkq6BZy9UToewHGRl95J8Z_DjJ2UQWwvAQkZqfW6pX6
 bb1uKewvSogWHitaoLNh.ftbCCjEP4LR9pATP8JssT2U_8ScqIF96dwYHG2y.0tAJpz__uC3j6Tr
 lsZnPGAhQ6YHVoDk2qpglyunl5BPY5wvVZ7mKlaapyBuQ1sli0bo5WA7doR7FdiIfQxt.0l1xBJb
 b7Kd9NJ0LcEK_YX6QKyTO8uqayV_QoEDXYrXDPlDMnGWkD2u94aR20.o5fs0BcsTvMxE.VgQV2nU
 fkDQy13em57oRFvW6xCpQ08OU_ccf__5cBuSQPKBHKyV8UPb6_4gxwsfC0L6_ZD7qmCCRhr6Qv_.
 eyP3Hp5V4qh_8gEFQhxWJ4skDM1pSlocuSIkfO_CmZZFnWKPofh6Uk7cjgaaPre1zHU_APdiyZqW
 SNz46KZsfJRhaGuYTH.3SaMMELfYEyKYofyymCBAtabvlOnzaVIkEN3yOzP_naB.Mps52tWRa6g-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Fri, 24 Apr 2020 10:31:58 +0000
Received: by smtp425.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID b4a0e46190220c2e4ba0022f1e9f3a60; 
 Fri, 24 Apr 2020 10:11:40 +0000 (UTC)
Subject: Re: build - ldb depends on missing system library/libraries
To: samba-technical@lists.samba.org
References: <af287cc4-1b97-da90-11de-60755a77fb14.ref@yahoo.co.uk>
 <af287cc4-1b97-da90-11de-60755a77fb14@yahoo.co.uk>
 <b88fbfaa-969b-8825-568c-741187b8d014@yahoo.co.uk>
 <b5f8c464-3dc2-db53-2f5e-1cd4850decde@samba.org>
X-Pep-Version: 2.0
Message-ID: <0c073dad-8924-3bf6-fad2-12c5323d628f@yahoo.co.uk>
Date: Fri, 24 Apr 2020 11:11:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b5f8c464-3dc2-db53-2f5e-1cd4850decde@samba.org>
Content-Language: en-US
X-Mailer: WebService/1.1.15776 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: lejeczek via samba-technical <samba-technical@lists.samba.org>
Reply-To: lejeczek <peljasz@yahoo.co.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 24/04/2020 10:28, Rowland penny wrote:
> On 24/04/2020 10:04, lejeczek via samba-technical wrote:
>>
>> On 23/04/2020 19:31, lejeczek via samba-technical wrote:
>>> hi guys..
>>>
>>> I'm trying to rpm build Samba on Centos8 but process fails
>>> as below.
>
> Have you run this:
>
> https://git.samba.org/?p=3Dsamba.git;a=3Dblob_plain;f=3Dbootstrap/gener=
ated-dists/centos8/bootstrap.sh;hb=3Dv4-12-test
>
>
> Rowland
>
>

bootstrap.sh does not fix/help my setup.

=2E.
Checking for system pyldb-util.cpython-36m-x86_64-linux-gnu
(>=3D2.0.7 <=3D2.0.999)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : not found
ERROR: Use of system library ldb depends on missing system
library/libraries ['pyldb-util.cpython-36m-x86_64-linux-gnu']

On Centos8 (which still is very messy in some places -
reason I try to re/build is because with freeIPA + Samba
integration these services fail to start)
I have these os-wide available on the box:

ldb-tools-2.0.7-3.el8.x86_64
libldb-2.0.7-3.el8.x86_64
libldb-devel-2.0.7-3.el8.x86_64
lldb-9.0.0-2.module_el8.1.0+288+74592915.x86_64
python3-ldb-2.0.7-3.el8.x86_64
python3-lldb-9.0.0-2.module_el8.1.0+288+74592915.x86_64

So what I'm doing is I use "official" Centos way to get
sources and I follow Centos devel's "howto".

many thanks, L.
