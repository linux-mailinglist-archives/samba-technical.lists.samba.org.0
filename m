Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD47162CEF
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 18:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Vr0PZJC8lMcQIEI8os70kgXZ2mA3cNYdyrKscaqJ3zI=; b=aOEdSMaZDiRqEMhVkQT2AKhu2e
	xbK1pbsVFYS0jZxexircgQqsE1ndQy9nU7KPH1J+N7MExk46ZkudKbtMS19kl1oRN12ttGRX163u1
	GYn8BuJm+sKCQ30sAFpApyG4IuR3KAmkb8lGISZuKIooyi9XVJFAJn94t6eNQBl6KDfEfu4gR5CWv
	/V8V90fvDSlmzmsKhu6jbTmsRaBDi1eNafsdGtcG76yu4ifjhD+kgJfnOMOvKCOoVet9WfCfwdnBn
	bAdw4QrFgJeX58/BoIOH1MaOaRQOWcaAqjWeo8CJ1D5U7kqoqxZTOj43XNR2twNw5arKwyEy6TL24
	9tWz+qpg==;
Received: from localhost ([::1]:18314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j46j0-00APVi-75; Tue, 18 Feb 2020 17:31:58 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:36433) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j46iu-00APVa-PB
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 17:31:55 +0000
Received: by mail-oi1-x234.google.com with SMTP id c16so20923074oic.3
 for <samba-technical@lists.samba.org>; Tue, 18 Feb 2020 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=RuU1eY4VofcfxTeWqCmL58I/EZ6C79ErugA5oZHFzi8=;
 b=CqorQ+Tl8X2YQVFdRCPRQrN7czfPuE5gZrsNE8tsCoy36++x2LttK0TfnIAyXu0MHF
 7Vtq+ocK/1jMnW/qmr3NxoDQCOHQ4shZ5hVxUMeSF0NCJ+GZS19XRVw1KtsJwHwO2qhd
 cgJjN2+tXK0sKbWYQFYs2iy07lhtmrX1mB+3y2SgCvtaqiTdhPLVTLOsZ1TZywXu0VXg
 xqprAcnyDWZ0A+ciZdUgRjt1JVEKFMeqHR9Driqgh8BuxrUYRLFWj5a2njGFQ7/RLzUw
 RNn9EFU4YaLmInFKNj/jK07nyN1/Z93Gawd1Ys3M4b+Whryycr/cY3ih8JaQGqfxes9S
 dpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=RuU1eY4VofcfxTeWqCmL58I/EZ6C79ErugA5oZHFzi8=;
 b=rfWGu5r8RyqEOuAw7MXP/kIRoR0LSI5n9qBzOefC/YWMrBNfGRH5D3P/DMjLsQDqUu
 V02ZzWLOfMvPViTh6K8L0EgCPhuphkrSINDQ9fh/doSTF76HGX25IgfZLIzqrOIRj527
 3bEtw7DZ9B1Dm6AeWe/EeNxToyVMm8FX2lavYrxTUS27pf1OoobBLJ1J/ZapD/7Aurt/
 rx2BGPC4aaxuDK8LxqJTBQf6m1oPU+SbKbFkUNjaC7hTzHt9sPDFL1QMNqQwDR7YThAM
 pYgL8dBlUQX/NKmL2fMcvFEWRviVv3Owc4gutMOF+QngEJs+r9manTvR/tCbaZK6Iytf
 lUBA==
X-Gm-Message-State: APjAAAVHSJLMx6VLXJepCpY8Ij6ArEmE1ohG8z97IpPnloJSieygLKri
 X6x08snTReth/NfTmaqKbh8d+wfFOADlIfanODJEJwUnRCg=
X-Google-Smtp-Source: APXvYqwKNXJkYgCZHjgpFQ2fB9mOD5eUtBjmprceTMNVG2vcAvPaeVNYNCLSIE0TtcwV4HtI8g18Boo3KaGS3Mjgycw=
X-Received: by 2002:aca:560b:: with SMTP id k11mr1929202oib.53.1582047109027; 
 Tue, 18 Feb 2020 09:31:49 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
In-Reply-To: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
Date: Tue, 18 Feb 2020 12:31:37 -0500
Message-ID: <CAB5c7xrB0O=zfaQetSpSW-Pp1O1bd9=DY89=4njUQ7VYF=P74w@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 18, 2020 at 11:07 AM Isaac Boukris via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi,
>
> I tested net-ads-search from a joined machine configured with "ldap
> ssl ads = yes", and it works once I also set "client ldap sasl
> wrapping = plain".
>

This is part is I believe expected. MS-ADTS 5.1.1.2 states:
"While Active Directory permits SASL binds to be performed on an
SSL/TLS-protected connection, it does not permit the use of SASL-layer
confidentiality/integrity protection mechanisms on such a connection."
