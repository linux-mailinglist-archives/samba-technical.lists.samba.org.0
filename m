Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F2B1CD63
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 22:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NCnEOM0+5At4zWpEFedTLOu1MHRKHpFFfcTf/i7KYZo=; b=ZX8PkJ7zqZep1RVAjNlHMVa4tX
	rD+WctidAZcnjajZmNBupSCZd4ohgEGjc5xjsD6sKbDxjosN61X8GlbZWMdT+I34C80leKUsAoJvK
	Wg9N7yp7B9YPzOanE4p5jz4mMpwe/4F8GyTU9P/3rB3uCkpmpcx8PmUzudpY/IHiyZmU2Ki5fXgG5
	70m9dZE/NgV80U70oNtR0dgdL6mi59jMxv8vIXFBxMTKXeQSS9JfCSKir3lxGhKD8bx/IHIVaaf+A
	4i9lkpGlVgzr9nV8+TwOAat3lNq5NjZuIVvkR9MIBKw1J3mwzsMlr1ti0dAuWhOBLd0bhDsNshtMP
	V6f0W/Iw==;
Received: from ip6-localhost ([::1]:22536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujkdT-00ETiW-Mw; Wed, 06 Aug 2025 20:21:19 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:59879) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujkdQ-00ETiK-EM
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 20:21:18 +0000
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4b0619a353dso2769261cf.3
 for <samba-technical@lists.samba.org>; Wed, 06 Aug 2025 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754511674; x=1755116474; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCnEOM0+5At4zWpEFedTLOu1MHRKHpFFfcTf/i7KYZo=;
 b=VPVC6CmtPMkwvYnyI+lyIjuneC69p0PoC3IwqNJu0dlmVa8KXGF51t7ux8YRugrYwu
 EgF379SKOjKmClGnExHH54EtfBhd5jWsPrCbtaYbAnYdcukt3CnA2ZpG67JeKfD8bI+6
 RJrVFFhyiaj9M6t1JShSyTEDanTapL5RmPHQylfAsTgqp1Lxqs4pLRKw3TVGL8jtsmr+
 5PWFIBfta3VJsnDsjAojgEj2Fm2pxKLEdv23kiVB8QKenX50ZtYkAbfwmuGMicju2h2K
 p3Quj+WklUKV4z7Fr5cbNJ7vyU0ue3UCqiLil1MvyJbcKPAfMKbvQWr+6oh4FT/eQEgX
 Wvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754511674; x=1755116474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NCnEOM0+5At4zWpEFedTLOu1MHRKHpFFfcTf/i7KYZo=;
 b=ir1ZUv9dT8QcWEpqiLcM9RiYoznAyLDCiTHzV7HCKl+xJndvSUnI3gu/aA+kslp/XT
 gOoaU6i0JiaAhfB/WRY93BiDSw9gYCLARJRSlDwKEUbcKcZizGFL9CvRlm180NaNp8YZ
 4qUwdq4Cd5rWsr/U+DHVWQjfZlXO5kX1eow3Y91CN66OLgeBjWzoUNymIB0jcAIw3iPc
 sGWOd6yH8ZEhL7gEdLpSmIb2hnTo8bSnYfz8eWYP1O1W0mumH2Rrcan+Q/tAr8tZdicZ
 Y+9f9jomGubiQBtS9vDQl+e13DIrd3GecXSziGODAwhz+2ibXFfencAVoYzOlErSY/pI
 JF2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUMbXqOarwV/LOJYSEFW2UfdzvUCwdse/iPjP9Mk2mtpAuB8cXh7FHYTfPi/ofxS+TyB4qNXd0oUaS8R7nzgE=@lists.samba.org
X-Gm-Message-State: AOJu0YzCLcFlE7pR1RY8tPoXAgbyl+JzMQGXcSCSeCmG3/H3XJdqf6/D
 zx7lXNyteQ8dSFkWSEj3Kh013FXu3ro94cD18F09ATHMW1/HENqPPohjJkI8W3f/wSVkCeEMg1u
 aFBaxHDta2i4jnjvc7nd5b+1E4It/WCc=
X-Gm-Gg: ASbGncviR2CfbksBjsI3WD/82faIbQ48XFPqtHcRXhsYPvqOQaW6mopWwoUMT+sDU/+
 A19n3msKT40sD9d+djRIbrt/HJphtWs4RfGLw5/75IKpLusATHWDrDCpk6WmJj5eccrNXPJUDbR
 nfAhI51ytfsRtBHrTa1GKuAq8khaogdiYmJQwKLEL8GyRkCRcmsJAEz72yDZKmARPEBfX5TotGh
 yLruS6MpxgrUxA+VJWu0TC2640YS2s+DhJHTY8/ppEE9grwPhU=
X-Google-Smtp-Source: AGHT+IH74oSmXJN1vofJGgPM/smKCxkF5pCCuVjuK0ayvaD/rAmmqEZaUQucXDsYmV7mwckOU46nQB8cigZPNwsJWX4=
X-Received: by 2002:ac8:5a15:0:b0:4b0:80c7:ba33 with SMTP id
 d75a77b69052e-4b09258d4e2mr56214831cf.23.1754511674272; Wed, 06 Aug 2025
 13:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754501401.git.metze@samba.org>
 <ea27f558-ab35-4607-b8a3-480c9ca4c6c3@samba.org>
In-Reply-To: <ea27f558-ab35-4607-b8a3-480c9ca4c6c3@samba.org>
Date: Wed, 6 Aug 2025 15:21:02 -0500
X-Gm-Features: Ac12FXwaSxmlyy1mfEowDl7JvrjiWa5felRtPiCuaGMIWybZymabvA0dGPYSW1g
Message-ID: <CAH2r5mvA7CWGR0cDn0DrxvMXdcmcJru1nOKPr1FD=rANPyYTHA@mail.gmail.com>
Subject: Re: [PATCH 00/18] smb: smbdirect: more use of common structures e.g.
 smbdirect_send_io
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged those 7 additional small patches into cifs-2.6.git
for-next pending more review and testing.

On Wed, Aug 6, 2025 at 12:41=E2=80=AFPM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 06.08.25 um 19:35 schrieb Stefan Metzmacher via samba-technical:
> > Hi,
> >
> > this is the next step towards a common smbdirect layer
> > between cifs.ko and ksmbd.ko, with the aim to provide
> > a socket layer for userspace usage at the end of the road.
> >
> > This patchset focuses on the usage of a common
> > smbdirect_send_io and related structures in smbdirect_socket.send_io.
> >
> > Note only patches 01-08 are intended to be merged soon,
>
> Sorry it's just 01-07.
>
> metze



--=20
Thanks,

Steve

