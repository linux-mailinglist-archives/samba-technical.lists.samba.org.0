Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F3204260
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 23:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Q3Vq9NJpDcCqfIbA9BPSfWV6SU0elnYG70oOF0Pi5F0=; b=mD7b82F0la45GMnf537gUiQP9n
	2TovQL713sqH+g1/KfETJZqGjK6jzIbvg6jgaH53u+R83z+sPLTuFsFlEGZ3jylTp0xQz48WQj+LW
	ZNdEQ6WjetpFdp6lR5d2ttJ55LR9mkGHAxqgACJPJU3udirmOcS4Hly0nn3Ofqqt7WMY0XdeoUEbN
	Anqy8PnMyShFJTM7F6k7kiuA5nTvUQ7I5coYow5YfHhxy5cQKiGNDHbnv7UNPmZUk/WE6usJKTdS7
	BCDE0eo06EKNVpAn8zssEb4tXY4YmicVBL+a24acHejbscBxSyTDWDhcH4uGRYmObkT/ccZLFOGpL
	1h/THnyg==;
Received: from localhost ([::1]:30122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnTaD-001thM-Jq; Mon, 22 Jun 2020 21:02:25 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:39576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnTa7-001thF-Vx
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 21:02:22 +0000
Received: by mail-lf1-x144.google.com with SMTP id d21so8364495lfb.6
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 14:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3Vq9NJpDcCqfIbA9BPSfWV6SU0elnYG70oOF0Pi5F0=;
 b=GeI2jpCyasmAyS6rC/36tn4bf9fuyQUQovyIl8dLNXWJSf5R5r89QmaXEJpRXs6ZPI
 zYcgPGBypobLuWq/Qg46QA83DVKRPBT0ggH8ehYPQgx7hNYh1zO8BWeORBIeqzQYaegH
 DSZnGWMsztL5T43ciSILaVoIlDsWYZ5LOwPsOjgiGrn/XqNUVYquPuhYDFzVn1ZEg6ot
 vtqg0tl+g9Pff90jBQx8z9q3v8clTqn5yn/JoBlwZbgcKRmrag2Av+3SrduqpA6Obuh8
 OeHDpBrsBlFYuNMvg+0zRCW3/R92GwI869xXYI19BF9QmUIayAar7lH4VsSyStdp2vWu
 wzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3Vq9NJpDcCqfIbA9BPSfWV6SU0elnYG70oOF0Pi5F0=;
 b=lV5nAWwGcmu8tbDgfFC0RzvruSr2usSb9rVLU3FMd+jTBJA9d2jEg85i4NGKhTcrDk
 QO12cqQISo2cfN1c21VMgCv5HeALgReF9AFEgaSWCphbzsxPvZ1fIikTkWszYaHxcc2/
 cI6nsLMW593flz2o/Egyh/YdGVhz+x3x56JZ1uRXJ7qwgXVcM6e82ykOz1/M191N8sqv
 cEX6klAsL5sqCkKV3KcOJOTxAVC1cULgN0VBMSkAaSyjD6z1jl/5DPqcu8LjlppABJCT
 EGPF7OfGboR0l3j+kk+ER2u7CuLnomrV2ElsVxOwgLSnn6KHwrg+Pp7PJl6I1CgAVEjj
 f8dA==
X-Gm-Message-State: AOAM5328c5/oNwwtCo20aVNjOOGueIcZiY8a6rUrdtqXZsy5jgvWgAxv
 vUUDjE6WHN9dypWDEL/2kdoo9ErdkzmWrn5dJCAgNrnsruA=
X-Google-Smtp-Source: ABdhPJxDggn8qoJHa+ooBT3dJNlKTgNT/xTZj6iUy/WwKf0Nq+tCm2col/F2BWun4Px/TozEBH/ckloILu5mdQbEe/k=
X-Received: by 2002:a05:6512:3107:: with SMTP id
 n7mr11048710lfb.63.1592859738181; 
 Mon, 22 Jun 2020 14:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
 <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
In-Reply-To: <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
Date: Mon, 22 Jun 2020 23:02:07 +0200
Message-ID: <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: Andrew Bartlett <abartlet@samba.org>
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

On Mon, Jun 22, 2020 at 9:32 PM Andrew Bartlett <abartlet@samba.org> wrote:
>
> Likewise, ldap ssl ads should explain more which operations it applies
> to (additionally note it doesn't apply to tldap and so idmap_ad as TLS
> isn't implemented there yet).

Yeah, I'm still unclear how it relates to and differs from "ldap ssl".

Another idea I've discussed with Andreas, we could implicitly set
"client ldap sasl wrapping" to "plain" when we *know* we are over TLS,
to avoid having the admin set to "plain" globally, but this can wait I
guess.

