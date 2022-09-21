Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102B5BF3F9
	for <lists+samba-technical@lfdr.de>; Wed, 21 Sep 2022 04:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4T25nA/FgFEooMxfsXpfLKwoZW6FSajz+HWNS/5YNOI=; b=br3OjQoIAC9pcGBIELh2FitDxW
	ttt5QRipv/Tnx4ajek8+Uxlht1ZotnFsTDZ4hOi/NE6Mc5Au0FegqdiY0yhL68TbKhZjBKJVqYfVc
	grXLY52xsxcYe7zV5OCwiR+ZgNnYNj9oSwMF6ONlbRJb7GyOuZ3jwCg7ELJkWvIOji/nr48tXiYXY
	jxnDsBQUhqwGWLKrDIKgTTklOCP7NfsM5BbdryW+3KFg7WLbBP0aDasv+ImFnRnoMoiHCSa26puqV
	CQEothEI2nLGXLU3K/1GqY+9iQ8H7dt3XaSunKTAyu1fxvf/qdKM0D3/525TeWF5uMSEt7EAOLkba
	F5zXbSHQ==;
Received: from ip6-localhost ([::1]:24806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oaprV-002OWw-CV; Wed, 21 Sep 2022 02:53:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oaprR-002OWn-57
 for samba-technical@lists.samba.org; Wed, 21 Sep 2022 02:53:19 +0000
Received: by mail-ed1-x52e.google.com with SMTP id y8so6599620edc.10
 for <samba-technical@lists.samba.org>; Tue, 20 Sep 2022 19:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EHfMzbyD1AwG/I0F5ZxloBlRp0UV6MTEWChTXXEthCo=;
 b=e3TpWGBWqskMTzg54PSG2hcKD4XvAM4ZUQ2KtwLcdBxAFdPwCu/+wBMJ+wzvm0Q8T9
 Y0DSNTVXHYpkWuUqQUmSzBABFchN0zUw4cRwH7S93kAdyaPpC3ecGq/JGhBeqQCLfY/F
 /itQcG3ZKn0r2rRynC9dAIcvdr+/hiVjCsW9MggvTpRa6iOw7CO7O+dFnb4bA+G/imAc
 sUuiwrlqYoeyDHS/HengyzVVYlZGDWbnd89w+TKjSLjVE+I15qQUgsZ+Mmys3Up98BUg
 QkR+H0J0Gf/VHf5UcL4oYLnrvCTxcyZONScL/7WPeYBcjix8v0DqenL6CkFq2MzeBwIQ
 2N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EHfMzbyD1AwG/I0F5ZxloBlRp0UV6MTEWChTXXEthCo=;
 b=mKDkMnf8I4mrPZVUubdNs/3Uya+/quj5ClvxIA4Fm8uggsCyrDHomUWueIDfmXQzd1
 Pfz3Ri/mO5Vs0HrkduH83E5bH9PPasBumG8lTihadSR7yNUpd1OfGdyhKI4hwFRPjWSo
 DcOBohRnfhn4J9lQleI+vgDAPOL1niRDDOPMQuHU1QLUygEmw1NcaChUEOdYhgVhbF0z
 alEr7IApD6h8UWdHIa41Rem284URXdyvjurh/+Imueci76beUKnu7B/vDwLrRUJxxq1h
 U/G9NunzetzTLLSfYqxheaUMtmYUFDggpbZIQ5lPTfJ6sv++thsNyQsgsxzD2r9N3ue2
 v/jw==
X-Gm-Message-State: ACrzQf2Y9kqgviEIM8KY0OSzjMxSv8AQ66X5HqxKX3OhmCwXRzY7lQTJ
 u3nT1Kdx2vueHCqUXwQ9V9C2Rra9oLC4d+391Pm74gkaXnA=
X-Google-Smtp-Source: AMsMyM5ucfaFiK2z/ZfBjH5a+NhbRK/AIlejOGTA2ogo/6GHeN/JRT3L1TYYKf7hIP8iHLLQXcmaGyYqu6e0w1viGi4=
X-Received: by 2002:aa7:c9c4:0:b0:452:1d98:1be3 with SMTP id
 i4-20020aa7c9c4000000b004521d981be3mr22769410edt.289.1663728796109; Tue, 20
 Sep 2022 19:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
In-Reply-To: <YyToAYaXsfopiTdh@jeremy-acer>
Date: Tue, 20 Sep 2022 22:53:04 -0400
Message-ID: <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: Jeremy Allison <jra@samba.org>
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

On Fri, Sep 16, 2022 at 5:17 PM Jeremy Allison <jra@samba.org> wrote:

> On Fri, Sep 16, 2022 at 01:33:26PM -0700, Jeremy Allison via
> samba-technical wrote:
> >On Fri, Sep 16, 2022 at 04:17:46PM -0400, Nathaniel W. Turner via
> samba-technical wrote:
> >>Hi folks,
> >>
> >>I'm investigating an apparent regression in IPv6 support in the "net"
> >>command, and I have some questions about commit
> >>d882add695bbd5ea03961c08ac2c0380fbf2947b.
> >>
> >>It looks like it was intended to improve and simplify DNS lookups, but
> >>unless I'm reading it wrong, it seems to have introduced the assumption
> >>that if a DC has IPv4 addresses, all clients will too.
> >>
> >>If a DC is configured to support both IPv4 and IPv6, and a client in that
> >>environment is configured IPv6-only (e.g. as part of a transition to
> >>all-IPv6), it looks like the logic will pick one of the DC's IPv4
> addresses
> >>and ignore it's IPv6 addresses.
> >>
> >>Am I missing something?
> >
> >No that's probably correct. I didn't think I'd
> >changed the logic here, but it seems I did.
> >
> >If you'd like to log a bug and send a fix for this
> >to gitlab, I'm happy to review and get it into
> >the supported trees.
>
> This is internal to discover_dc_dns(), so you
> could probably add an extra flag here to tell
> discover_dc_dns() to return IPv6-only, and
> have it skip that DC if it doesn't have an
> IPv6 address returned.
>

Thanks for taking a look at this! I'll work on a patch.

What's the right behavior here? In the case where the local server has no
routable IPv6 addresses (e.g. link local IPv6 addresses only), we might
infer that we're only interested in IPv4 addresses for the DC, and vice
versa.

If we don't have easy access to the set of local addresses in this code
path, a simpler alternative might be to pick up to 1 IPv4 address and up to
1 IPv6 address, and potentially try them both. If the test connection fails
quickly in the case of an unusable address, this might be OK. Thoughts?

n
