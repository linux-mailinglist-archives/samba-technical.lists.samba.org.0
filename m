Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E5E6DAC
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 08:58:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5GgZfew7IAI2skEmBlHtXMHBlxKJ7UoSQ8a+JdVtDN0=; b=wCAC6OEsTYDtFrslb4aJlG7CQJ
	kWx/AfYUHfEyqrkdWD3myEHcnBUauzbB5U1BWu9V1deO32D4vhTbFMfCowhmCqXsqn8BrC1mD1zQi
	QD4wOHU0sHc9GNn6tmaanFE1DNsv2BlAuRqb3v139D80AWYkkm+PklvDJjRJB8NVvw3I8bE3871MD
	71tgQvtoJe7Fbz7TBx4OAsye+lKxxPw2slLc0k6yeYBUGaKAFELww35Sk0Jjd86Xuz5Kjv2OpemJ6
	sbZbymO7eo8qJk/0jmV4u6qGi6sX+5NY9/IZWZWKgGnq4/dOTzqIpCqnZoofSpWD70/F02izO+g4m
	fp7vocGQ==;
Received: from localhost ([::1]:41622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOzv9-002wFB-6C; Mon, 28 Oct 2019 07:58:35 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:57644) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iOzv4-002wF1-L8
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 07:58:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id DBC1ED39FF903;
 Mon, 28 Oct 2019 10:58:27 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 28t2s-p9I9Uu; Mon, 28 Oct 2019 10:58:27 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 7921CD3AA22D5;
 Mon, 28 Oct 2019 10:58:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 7921CD3AA22D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572249507;
 bh=5GgZfew7IAI2skEmBlHtXMHBlxKJ7UoSQ8a+JdVtDN0=;
 h=From:To:Message-ID:Date:MIME-Version;
 b=OfpnJgBDHhuh23Ia2oD2BJxDPBuCTP86jRA48zgI3kCYZiVOriQYp4Dgm2SwL6MyX
 TbBKDLjpAaIcHikZ2qkFHpSQt90MS0lQvbSY4UczfKP+voJip71jz2hksndo3b0EVM
 DWs3w76qKOI9GwpQlFPkODlqx/9rwqIEVjXVTlazsOFqMe38JRrlFT7YNLjraMNOlV
 oYSPq4oIDNmuYAFMNvkL0CO2vi4cGpCOwm5N8xO/BqByILhtsOfq2OdHem4Idj0U9L
 mZMCOUXd15A8uC7Gp6blcPaGpWnFddAZg7X8r2ZKd1FAq+XZpuLQWGM5cwUVvxLf6a
 gYhWSBAuMTUIw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fpTlupM0LIyc; Mon, 28 Oct 2019 10:58:27 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-115.ip.moscow.rt.ru
 [90.154.70.115])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 49B26D39FF903;
 Mon, 28 Oct 2019 10:58:26 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <2538732.qaAAVzzFgV@magrathea>
 <dda32395-9ac0-9dad-5528-7f284f5101df@rosalinux.ru>
Message-ID: <7837d34e-dd46-2f3e-c14c-c9bd6510b940@rosalinux.ru>
Date: Mon, 28 Oct 2019 10:58:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dda32395-9ac0-9dad-5528-7f284f5101df@rosalinux.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: quoted-printable
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> <...>
> There are 2 possible solutions:
>
> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto=20
> smbspool;" if env does not contain "negotiate" instead of chekcing to=20
> be either null or 0 - how correct will this be?
>
I mean this:

diff --git a/source3/client/smbspool_krb5_wrapper.c=20
b/source3/client/smbspool_krb5_wrapper.c
index bff1df417e8..000a613291e 100644
--- a/source3/client/smbspool_krb5_wrapper.c
+++ b/source3/client/smbspool_krb5_wrapper.c
@@ -149,7 +149,7 @@ int main(int argc, char *argv[])
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env =3D getenv("AUTH_INFO_REQ=
UIRED");

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If not set, then jus=
t call smbspool. */
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (env =3D=3D NULL || env[0] =3D=3D=
 0) {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (env =3D=3D NULL || env =3D=3D "=
none" || env[0] =3D=3D 0) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto smbspool;

or maybe it is not needed because cups will not set env=20
AUTH_INFO_REQUIRED if "AuthInfoRequired none" ? I've looked into=20
cups/scheduler/job.c, seems that it does set AUTH_INFO_REQUIRED=3Dnone=20
env, but I'm not sure at all.

Also, I'm not sure that cases like AUTH_INFO_REQUIRED=3Dxxx,none or=20
AUTH_INFO_REQUIRED=3Dnone,xxx are not possible.


