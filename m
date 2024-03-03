Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06B86F380
	for <lists+samba-technical@lfdr.de>; Sun,  3 Mar 2024 04:25:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6yIUnORpumXezRtbo78j26ge/4qtJhnke9kcXnIdLfM=; b=r33P+SouSsbL0hPzkGk+OO1e55
	jmNKbkFi1j4kEIKkSgVUQaIDwyMzFmJF71vb3j+AsWb6wO2ht/tfwjMw0O9ZephGbuqELTMbtAtiz
	2MVtvJG9YYT1kUT+NahYAilXDh9cwFSUy11uTEcsmda+vQ0Remcij3h7pg/QZuUnY9RcqACk4cwFn
	nwXvioQydesl+XFaoAqbEbt/GoP3/ZIzxihA1IQoIhROrTkxH3Tg9UHYj8LjRZryUx+Xigw+ezdON
	/mJp2MbjRl9hAnn2cErpjdU6px8Oya/NV8EnUM5P71MVje6Ogns1gqt3FNHxvAjMsSiPFujJwfjWm
	1OQqX3Sw==;
Received: from ip6-localhost ([::1]:57402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rgcT9-00BhGb-Ct; Sun, 03 Mar 2024 03:24:55 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:57575) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rgcT4-00BhGT-1y
 for samba-technical@lists.samba.org; Sun, 03 Mar 2024 03:24:52 +0000
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-429de32dad9so24252831cf.2
 for <samba-technical@lists.samba.org>; Sat, 02 Mar 2024 19:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709436284; x=1710041084; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q0YxWOye16qtKHeNY95GZkNLxhQcPDGok1yFNQXAT0g=;
 b=Bi0UiG9mEwP2Ac2IrGnJRtRa+7FzUVVJapGUOHa9SIYDNy+2HNwka3y/Z++GiFfN/p
 06eYAMixIi1c+WTVx65Ofg5PxCrU8IlYU6IEq85iAD/JMDtv/JSaUTOnIqT4obdZIcZN
 BzX0VSYyp8ODV9iMBco7+EdhRnTZUp/QaPphZgmbw/qhoZZiHcjUXM8F4nxDaFkfTKZ8
 DM7SDWP0ydcX9Ifi3xog916q0mIEl3esJvig4XhVpQECcgsXsSqV8Eik6a+dcxG2xSWe
 zgnbPbd7khx6x6ckCogM+Zpulf8KXTogMYH2W/5LlXseZtc4Uw2V8th664+GQcA28S0P
 8mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709436284; x=1710041084;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q0YxWOye16qtKHeNY95GZkNLxhQcPDGok1yFNQXAT0g=;
 b=JC7hLwV0Kxxb7igclfcc8meWrcrZHTl0/9BHwZgfU61Bjtono1hRcZTi83CnJCncCQ
 wnzyBCCkNiZzzwS2LhToA/wThKx4kCfHQg0V/egaYajMo19qg1xMR0V9DHpAcDoVBvxn
 rzvTDAEldaiHk+3xxpZ43reZABN6NqlD+GyS/tl5JcJnva3I3QoE68B0385wrUTiM90F
 bskHv5ep39knGNDRAJCxLIaMo+BRgKEjnimYgRPDhvhrKAVH+SyFp5otUAmaNft+2PPy
 iDpnwP4133OUjHuSwVN/X8B1gypGAIWfi529qeksTzx/ZGDI9Mim3MS9x4uAaqQC09zM
 V+2g==
X-Gm-Message-State: AOJu0YwBDy+lahGuBjZDxC1JeBUehlCApOw6kOeHYe7XPJ2kdnV2AmgZ
 +uFrnwb7CsR6E2hYYEKY4VJl+Dkm74uqQ1M0y5px08SAMshXNnIr4MLbKR6Uw1+Gk9zAh5Q0Jcw
 K9U9AYCTbhRMPhZmMXPpoAkU9THWfliBQ
X-Google-Smtp-Source: AGHT+IFCRb6BRhQybJ9F9UwtKpfXPxg6JDAHOUcD8FV4+vnD5GEzrzErBTapisRy/ZRmtRBkm+E7kMAu6Am3Ccwy61Y=
X-Received: by 2002:ac8:7d15:0:b0:42e:d65d:78d6 with SMTP id
 g21-20020ac87d15000000b0042ed65d78d6mr5477554qtb.51.1709436284083; Sat, 02
 Mar 2024 19:24:44 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 2 Mar 2024 19:21:24 -0800
Message-ID: <CACyXjPzVO5hDs8mXUWppErO6H+Gi4DbmO9tU+uz+rAdvJLkwHg@mail.gmail.com>
Subject: A QUERY_INFO FILE_STREAM_INFORMATION on Samba behaves differently
 than Windows when the buffer is not big enough.
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I am using Samba to test some stuff where we are using QUERY_INFO
FILE_STREAM_INFO and I notice that Samba behaves differently to Windows
around STATUS_BUFFER_OVERFLOW.

When Windows returns STATUS_BUFFER_OVERFLOW for a QUERY_INFO
FILE_STREAM_INFO it returns as many items as will fit in the space you say
is in your buffer.

Samba returns nothing.

I checked the code in master and it looks the same as earlier versions.

It looks like instead of returning STATUS_BUFFER_OVERFLOW, we should set an
error variable and break from the loop in marshall_stream_info.

Finally, the whole API around stream info is retarded anyway since you have
no way to know how many streams there are and now much space you need to
allow. (However, that is not Samba's fault.)

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
