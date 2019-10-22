Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05AE0454
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 14:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=sPE/wP3IRIzHIGQjXflzNTtqRAjhEQE5EM1Kn05E3To=; b=nvWmV83AyQzBFOZqHW2JMdmA76
	S/Cn/31LEjerzxtm3X1IFD+nbLICjIwGKPEVyLG9xP8cW2wBIUmvAR4eAYPiSXjbppAxWn0KB0iZj
	BxAp4KFYsETLRsiNId+1g2FVMlhHWjT6N/Y9tDPcyyWzXrBAeJ0FwQj1BuT5+9egZssy1XiL5ME+z
	n2RaLq9YSs2kJJu89zTOVierOSaY+KaAQLCEUVBR9DsP/0a2ecuTd/Mzq2L2pIEDl5vSMiJ5cxNG2
	J2iLq7TZ+js7j/D1ZK9N2lG43SlRZf0mR/W2HNkZiFPVbnnH6aNxm8hyFQ/grPSh6cBmv9QENTqDs
	jihw61Ww==;
Received: from localhost ([::1]:62690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMtk7-001P5f-43; Tue, 22 Oct 2019 12:58:31 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36347) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMtk2-001P5Y-GP
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 12:58:28 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d17so11963982qto.3
 for <samba-technical@lists.samba.org>; Tue, 22 Oct 2019 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=TmsT1wRzT7UJoOfx65LZ9HJMXaOq+zRv2vhjUnzGx4I=;
 b=ZzbvLf6HXITGuxkTu1SU6BI2mioEMJAZ3kSowKV3vKQpi5XD/dhEwfnaejaGA76s3x
 AzveL5KstJ6DmUx0Pf0mdsb4Ix2CbvBx9tGOZlt9uzGnUvj5y5iL6/F+eGVUgOkwuGOk
 bcjJ3uqPQ/I7qlCpfsZVEacFZd4jVWmlUZC8JrHBH0Qv8STTNz6bM8H/87FZVW/J/LGV
 mdQDRWtkedU05F+6ksXdDUD1G4yaV5Hkv5jigjdg/bb21FcbJW7uv6zhUGQXMIN8wg+C
 vIQjSd8zVYV40C2Y8zMgrQcS1/POFz+7blA5l2D9tKD1QcNHgI9NU6KpLJeeesCODXgU
 FLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=TmsT1wRzT7UJoOfx65LZ9HJMXaOq+zRv2vhjUnzGx4I=;
 b=qLOQBZB2Af5Cjk/zGrUr+/t5cesHnRgKpg1HX3RulmOFUKCKzg7MyHPZN+ONBSKD/A
 R9P9Y6E1Wd8sanQn0Jk1Bw2iydWNjb3Vvz04UXjAx74xIhQI8XH9ugSJHKJDfL7mY+Qv
 SjAxKCGck19jpWoUr/ezRg4U8cFdgjD51u2v4C5AnJxcrUSEdMJbNU+K2/CWMyW7JGF4
 riO9bMMW9dTYQproLttzXExoKBOfs8EF8wE+vCnAC2JYDG11hVxNFMnAU+L4q/Ud92yI
 omsnVlzMx4op3wy2rGI915vDPiUHYtrBW/HH72P6h2WW2YYBcm+k+2xwXw8tW3T4Ab3z
 49QQ==
X-Gm-Message-State: APjAAAUKzolHH06ZRjkMCiYwu5tRh/nQ/a2eNxQKHTv5anHyQVGJq3Zw
 H7bb42IquLPmfw0+z2wYxphDxFl7
X-Google-Smtp-Source: APXvYqwfOmFgdCwGIIGeU2846eRKH1MXewwldgMAkYYKkrR8k/fPDKESJP5ObjQTzi5G3ojvq6wn5Q==
X-Received: by 2002:ac8:72ce:: with SMTP id o14mr3261791qtp.62.1571749104596; 
 Tue, 22 Oct 2019 05:58:24 -0700 (PDT)
Received: from ?IPv6:2600:1000:b014:5c46:bc56:f5bb:cd43:9796?
 ([2600:1000:b014:5c46:bc56:f5bb:cd43:9796])
 by smtp.gmail.com with ESMTPSA id h184sm3466228qkd.66.2019.10.22.05.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2019 05:58:23 -0700 (PDT)
Mime-Version: 1.0 (1.0)
Subject: Re: [Release Planning 4.11] Samba 4.11.2
Date: Tue, 22 Oct 2019 08:58:21 -0400
Message-Id: <F881C011-7573-4946-B05A-7952A73BF945@gmail.com>
References: <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
In-Reply-To: <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
To: Dario Lesca <d.lesca@solinos.it>
X-Mailer: iPhone Mail (17A878)
Content-Type: text/plain;
	charset=utf-8
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On Oct 22, 2019, at 6:17 AM, Dario Lesca <d.lesca@solinos.it> wrote:
>=20
> =EF=BB=BF
> Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via samba-te=
chnical ha scritto:
>> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8, and
>> Fedora setup at=20
>> https://github.com/nkadel/samba4repo
>> . This setup uses
>> Heimdal Kerberos, which eased the gnutls requirements and made CentOS
>> 7 easier.
>=20
> Thanks Nico
> How can use your great work?
> I must rebuild all on my system (Centos8) or I can use a binary repo?
>=20
> Thank

Make a clone of the git repo, follow the notes in the README.md, and compile=
 it. I=E2=80=99ve not been publishing binaries because I=E2=80=99ve lacked t=
ime and resources to run a high security service for such critical and secur=
ity sensitive binaries.

> Dario Lesca
> (inviato dal mio Linux Fedora 30 Workstation)
