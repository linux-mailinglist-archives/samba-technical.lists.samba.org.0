Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5A1E5C41
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 11:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ds4H3wx/s2AHuaWREf0gaikvWCLi3XfyafU3UbaB5Lo=; b=DjwKEJMoFgz3yFoXLWMR5wc63X
	l7A2Ma7QFBoLUQ+1ShlN4pegsWYF2Uqf8XAJtdAmESjzAew1rd2l9zlNS8COFie6nrGwuaFBmOFys
	L4mNbB0cPlJXTRY6rdpjV/gLwltLILWhXrHK1X7mfsxpAus9nb+X76XB65qC9yETKowvVEYIBlUla
	9lANZDS+u0ezGOyn1qRH+25zBH5bB/nugBXm4QRBPrabyyyXO8dtg3eQdkkmnJjXrX3kkztWvF94O
	T48e2XrK446jmwZsAO4RnrmAei9PiSMPEc293HLoR/BVrXGPdN8IvsYzrx68WsStCNIXjF0LrS1AH
	MYfbpczw==;
Received: from localhost ([::1]:54286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeF3L-006BAP-LB; Thu, 28 May 2020 09:42:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:44696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeF3G-006BAI-J6
 for samba-technical@lists.samba.org; Thu, 28 May 2020 09:42:16 +0000
Received: by mail-lf1-x133.google.com with SMTP id w15so16146802lfe.11
 for <samba-technical@lists.samba.org>; Thu, 28 May 2020 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ds4H3wx/s2AHuaWREf0gaikvWCLi3XfyafU3UbaB5Lo=;
 b=t8lN5HiaeTcjVSWDzwseqXONYMgkp5AC1QzGcKQ3XLBj4de7ohpBqYJlBK/lIX9DP4
 wRm4T8/QhU+7gEfyEMs9lZEtc5U6R2GgZquSMTRJ8AF8J+oFDWVd+R16kFcs8WWT0nhQ
 rwRfPQZ1zaNUk94Rr0N2AcBURvsEPmMruDJdf3VbWk4pD1SwRtDDiRlWXE05olIqCzpj
 a5I9zrVusT8feCWcctxIPSr4VB59ACMmfzesbPueh+tW0HBp0KjmmmNzC5DQmwK3yLUi
 fXkfQ6mB0hO3nOyEIT7+rR2/u7n9H6YgbIyikqxMusoIE8Tr7rpjywlHCUTj5f2UF+UB
 WchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ds4H3wx/s2AHuaWREf0gaikvWCLi3XfyafU3UbaB5Lo=;
 b=fMe4+z3HMB4UfTbj14W5+lEvMmzRDq+qP35/a2SeJGPSblQGHfHXraaa82EEst2nco
 bFOV/PswS8gULzfJtr+68j3CPwLQq6e4x2oLpHb89J0XjQBkcJ7Y7FDl30/utRnCccOS
 e9E7BN2QsZc/pNltEk0VjKrlym5GJGI+cyH2VxVaVucMDJM9b+5mF/Y7GSJ9A8YC4P0W
 URMSfeIkfD6NQDWoEXuPvPndtTiNl7sunRh5DIWjOubxZffXHuqaMIc1ZdnKH4KtLsOb
 47kv0yLK1pW0YS8vMas/tdQKX1p8G+ZzWUhpzqoozkza3A+WzeX6WLOImXWflUJA7IUe
 A3Rw==
X-Gm-Message-State: AOAM531GsJccIFROWe9Nm0Bo7xMz3vIVmUlA59jMQcEwMdcjMbS1s1G+
 LOqQU1c7+48zNh+f4jmPDPXRuiZ9hJE4CQw5wis=
X-Google-Smtp-Source: ABdhPJwifj82aJ0y+iHFB/IRPV7fgD3PgP0gmU6xYMoDkOdkcJX9JU53W7SVGYzMD9Fvmz8JFkDKR8zrLKBVdT73Ueg=
X-Received: by 2002:ac2:504e:: with SMTP id a14mr1273457lfm.30.1590658933544; 
 Thu, 28 May 2020 02:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
In-Reply-To: <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
Date: Thu, 28 May 2020 11:42:02 +0200
Message-ID: <CAC-fF8SMD73rfx-3pHyDu5An=PfBvaVTxhLQ=7nsRzJip=O8vw@mail.gmail.com>
Subject: Re: Kerberos features talk at sambaxp
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 27, 2020 at 9:20 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> Also checkout the latest wireshark!

I checked out "ws-metze-current", not sure if related but I'm missing
the "decrypted" note on the bottom, which gives me indication that the
keytab worked (also feels a bit verbose).

