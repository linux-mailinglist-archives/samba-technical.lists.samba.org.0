Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16C17A0A3
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 08:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BwqQj4hw0PuV2sh0sjMoBOjoLOfAefzg5OaetY8Bbqg=; b=oNUAZZSa7OxUO1tqRiOIOeM1cb
	BQCGTqjJD85eiRjYe/oq+3T9ujUwiOSYfxHALhdcg4jvLZMmoE6Vaag/cK0EN1TMja6kzjCG7CiIE
	Fq31YEZP8KjebtreLIz5k3r1JD4+90HioMbd4SFGbd2V2Gfc+e94q1pS/TxATZQg2qMRKrYTfpxwR
	J8eK98stCHs1x5LJvT0pINq+Cdw281OuSM7iNDFNv8UHadteEmq2v1Q8sw3bF4JmdkfWYItVCmSyC
	0+sOx1gXx59h/uAmnDfDht914WtM1iuSClIH9fMxqdMABbL+pdHg4sBPU5dqzyF6NCH360uA6/ovg
	FmpqiQ9g==;
Received: from localhost ([::1]:22460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9lBh-00F0tG-Nd; Thu, 05 Mar 2020 07:44:57 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:50378) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j9lBc-00F0t9-MW
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 07:44:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 3887FD7CD86B6;
 Thu,  5 Mar 2020 10:44:48 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id E2uiLLeaWHzj; Thu,  5 Mar 2020 10:44:32 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id D7A90D1916C2E;
 Thu,  5 Mar 2020 10:44:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru D7A90D1916C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1583394272;
 bh=BwqQj4hw0PuV2sh0sjMoBOjoLOfAefzg5OaetY8Bbqg=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=J/wgjhThneTUg8J5rKKr69Km8j0Vg4bCasEEvjQ4ZgqGLkhqe58FCIbqnkBqml4PS
 phM3VYXV2CIFrUsbLk0QmaN8e0mdUt6OhSpK5zx18cuLpDZbV8tSoWNsNh0Miy2IzA
 MfiOpysY1qUSOJllBl8XLFCy1/A8mFUFmvcekCwdUbaaN5G7V1q7M+lthnnhT40Pkd
 dnuf/1VCDiea00Tlhfl74xsc6PNP5Q6UZxu1lfu6HYArIV1d7HaIPQPbuV2T9hTw02
 tsBqPFkCHvWyprX8NITliDE0dcKoENikp8gO2STDgGx+klQ68deFuuQn3JhqZKC6HS
 UiPrTn7zaswPQ==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id epm9AtaNQ8s5; Thu,  5 Mar 2020 10:44:32 +0300 (MSK)
Received: from [10.175.54.17] (unknown [176.59.48.190])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 952C7D18E15CE;
 Thu,  5 Mar 2020 10:44:32 +0300 (MSK)
Date: Thu, 05 Mar 2020 10:44:28 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <bcca2904922f9c6f0a3594c39a336f0ab175c4e8.camel@samba.org>
References: <20200303104715.GA11956@carrie2>
 <F5AB518A-4210-4A4F-B6E7-3FED4A78F7E6@rosalinux.ru>
 <bcca2904922f9c6f0a3594c39a336f0ab175c4e8.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Announce] Samba 4.12.0 Available for Download
To: Andrew Bartlett <abartlet@samba.org>,samba-technical@lists.samba.org
Message-ID: <DDE986AD-16BC-44FB-BD4A-CD17F9E8BA16@rosalinux.ru>
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
Cc: m.novosyolov@rosalinux.ru
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



5 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2020 =D0=B3=2E 9:34:36 GMT+03:00, Andrew =
Bartlett <abartlet@samba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Thu, 2020-03-05 at 08:13 +0300, Mikhail Novosyolov via samba-
>technical wrote:
>> Hello,
>>=20
>> What is the status of SMBv1 in Samba 4=2E12?
>
>Unchanged from Samba 4=2E11, that is off by default but fully supported=
=2E
>
>We are still planning to remove SMB1 in a future version because not
>only is is an old arcane protocol, it makes being a great SMB2 server
>harder=2E

Thanks=2E I have looked into the changelog of samba 4=2E11=2E0 [1], but 'c=
lient min protocol =3D NT1' had to be explicitly set in 4=2E8+=2E Could you=
 please clearify what exactly changed in 4=2E11 regarding smb1? Or maybe po=
int to a commit that made the change=2E

[1] https://www=2Esamba=2Eorg/samba/history/samba-4=2E11=2E0=2Ehtml

