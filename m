Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE8A301E6F
	for <lists+samba-technical@lfdr.de>; Sun, 24 Jan 2021 20:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nb7VY5v4QWTmOkFNIL/xw1BSme26nGp/MLzJ08hjp9M=; b=2RTiPKOWKVPtr2fg7c+86umFxH
	Gnuj5RmR0GF1Ng34F23y4H16XLODQbKdQJMoKl1NyBGq9iMGr6ndS3fqwmFtDj/zpF1dLNKX2QRoz
	T5xDBZ9wb/tbkQtQbRAGCD4RLpkZWqW2YGGKc0jMyrX0CjLei5D/vdneDriLqZ7npbJgl+MgqCbGe
	zGcWNG8ifQ+6Lc4dqiQ0A8MGXr2yHui+FwfrFXW5QJlUaGVO+SvuprpxXW/S2XUcfQGK9VDf3O/ar
	yfg9bldR1dTeExu99l82hiPwDAPiBEAmNNhUsm95dd+aAehS1x23mUt/ZuChlK1bvcXZtdCgOQT1d
	48qxqY6w==;
Received: from ip6-localhost ([::1]:19736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l3l1o-006vkl-0b; Sun, 24 Jan 2021 19:26:28 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46415) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l3l1g-006vke-PS
 for samba-technical@lists.samba.org; Sun, 24 Jan 2021 19:26:25 +0000
Received: by mail-ot1-x333.google.com with SMTP id d1so10652025otl.13
 for <samba-technical@lists.samba.org>; Sun, 24 Jan 2021 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nb7VY5v4QWTmOkFNIL/xw1BSme26nGp/MLzJ08hjp9M=;
 b=PfnMoq9jj7d16YMpLSRzT3gu6A9INSeBSU6yTZgWykumspGrNATKELeGg8FiG+XlrO
 zFwJbL7F01Y7GpkN+SdEKTMyG5Jy0Bpij2nH7GTWxawXOzUNXOK7kJ+VQtd9BrRmdd2G
 PhIJg5zbnJwWoIkvSET8UKlvwHizuZoUo3lMTQh/89+eK7SJti2XM0CcYjLeiA7XW82K
 MrHU5g3LqBX7aC7HrkkqqD9Z0LFGEYU0JOIDw9lZ0FSElSDGHA3AqEcmjvFOtIDCHVFx
 LGN7xp6c9xq9/NzykQFBTD9jucxkE5g+g5DHkziPIvRGz719L0b6pRH26e1D1sE4MfTe
 qTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nb7VY5v4QWTmOkFNIL/xw1BSme26nGp/MLzJ08hjp9M=;
 b=XsHYObv43ej4xeNM34ZOMnvtMb+eN+OBVfyDAQsEe6IzOZPHx48MEmDuY09mm2cRu2
 E1Jdh+/Ikv533x4R5ch59zsBvQrz701PNKmITnpiZrM5Le3wDMaMqMKiAu577tnPDiFK
 kNq/bEbt6iE5ZdxyfAHBjynu0C3ia3tfIsP1G6QwqPyKlIVpTqPtolJOBMNav1GBAeGU
 FvGNeMTOyFstZVEVHd1rVLj7/IIUwPiQgm4NfgJzIF93g9lzUhXSL3YhnPVG8++tT5KZ
 FQyUEIap1DZymNcfD5z5luviMBJ4vj+uCavo1ETIT0tpCdWunR+pZTSOTNuU8dvdyAf0
 1X3w==
X-Gm-Message-State: AOAM532iQlWFrlRAoS3GhNTmt3dI7AcIDOsCL9gpFl1bbdpw0kCdJam2
 IFKmBYIsmRCC0dnfRxVybMuLF09cKSZ83SWmuHI=
X-Google-Smtp-Source: ABdhPJzqvokoXOUshGLbrYOmmyfMKAz1ifHKQhTSrKiulO+pFwqKRM7tXbbdKtnlbevDnv1yMsbDInnf/86VLqGXlsE=
X-Received: by 2002:a05:6830:1e79:: with SMTP id
 m25mr10542321otr.31.1611516365158; 
 Sun, 24 Jan 2021 11:26:05 -0800 (PST)
MIME-Version: 1.0
References: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
In-Reply-To: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
Date: Sun, 24 Jan 2021 14:21:30 -0500
Message-ID: <CAOCN9rwAE2wsEkgkMmxvi6i2QxBvvaGNNcWh5E4=az3HwsA=ng@mail.gmail.com>
Subject: Re: [Release Planning 4.14] Samba 4.14.0rc2
To: Karolin Seeger <kseeger@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 22, 2021 at 4:51 AM Karolin Seeger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> Samba 4.14.0rc2 is scheduled for Thursday, February 18 2021.

Sadly, samba-4.14.0rc1 has a dependency on tallo-2.3.2. Any idea when
that will make it to https://ftp.samba.org/pub/talloc/ ?

