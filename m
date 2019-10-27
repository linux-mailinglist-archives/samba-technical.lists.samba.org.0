Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56960E623D
	for <lists+samba-technical@lfdr.de>; Sun, 27 Oct 2019 12:24:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=GHErEpPUYRdwVi/W6VDtLFC9cShh+la64rB5VrNQ4kw=; b=fnNiN98g++TK9tm8iH58V5tX8C
	zHdkTI+vWAA8fsaoTLGCI88gSYos/DjCCqvDwxYVam7SMJgvshGH7+G+YERzuIqO7EcraRC6FTNfq
	gyGu3Q81oIsI+9YOPLaW3fHyWkE+rWpNZyMPfmXvbc42ZR+Td22WrbcgdT2MJTFc+ervBwu83I4Td
	hw3kWxSgTDWXf5/q8ac4XJG5I5SquHJRYqpHe8e8UXImRmx0aZkthSJHTVUbWqnNiTOhGa9o7K4Rm
	fvAFE2TOjDHNwTG6IzDM4D6F2TspKW7GwpmsHkH1vbQYzEONCWXddWOfaMbQ60zSbTcxMWgCjJO1x
	UV7iMQEw==;
Received: from localhost ([::1]:20100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOgeE-002n50-Od; Sun, 27 Oct 2019 11:23:50 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:55200) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iOgeA-002n4t-Kn
 for samba-technical@lists.samba.org; Sun, 27 Oct 2019 11:23:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 344A2D39F00A7
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 14:23:42 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SAoOlX_x1Fgp for <samba-technical@lists.samba.org>;
 Sun, 27 Oct 2019 14:23:42 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id DDEB8D39F00AD
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 14:23:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru DDEB8D39F00AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572175421;
 bh=GHErEpPUYRdwVi/W6VDtLFC9cShh+la64rB5VrNQ4kw=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=HnTyMSgxbq8qhfPeNzZrxXhhzT8XsfHQ92cpEvzPalzdmI9vL58PiiHYC28R1g0/3
 Li+NKESEXA+PAtJ5cqvcIzgQtw83vJ52d1kq1wmvzIA/lBQkOQjxtrla1K8GavsYNP
 WgbjvDyb7lIBKnZZqRcGaiUe1nuRTIBjaQA1F2ZfW6xlOSbZDOvAJNVZXqZMJiBUHq
 fLwgp38hNY02h5cmN8ULMnqo97Un7JAV4PuVBImFtR9lJy/gPkDAml5k8W4UElkads
 4Z2dAB04m83A/+tDDqSJC7iqgII/4J3TvA11NKcIV3r7oNCWcRujolkyIN7yHkoJlz
 VR02Rbfe4t6yw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IRRunzu7GOou for <samba-technical@lists.samba.org>;
 Sun, 27 Oct 2019 14:23:41 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-115.ip.moscow.rt.ru
 [90.154.70.115])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id BFF4CD39F00A5
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 14:23:41 +0300 (MSK)
Subject: Re: Building on armhf
To: samba-technical@lists.samba.org
References: <vmime.5da9d2cf.67ea.2e47a9a962d3963f@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <7a937e93-44a0-b772-c358-869b395de803@rosalinux.ru>
Date: Sun, 27 Oct 2019 14:23:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <vmime.5da9d2cf.67ea.2e47a9a962d3963f@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

18.10.2019 17:57, L.P.H. van Belle via samba-technical =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
> Hai,
>  =20
> Just a question here, is there a way to speed up building for armhf.
> im already using ccache and tmpfs but the cpu emulation of armhf makes =
it so slow..
>  =20
> im using qemu to simulate the armhf env.
>
> With the current build speed=C2=A0taking me hours ..=C2=A0 :-(
>  =20
> Anyone suggestion to speed this up or is it just impossible due to the =
cpu emulation.
Cross-compilation on a x86 host for amv7 target should be possible. Then=20
compilers are run natively without CPU emulation.

