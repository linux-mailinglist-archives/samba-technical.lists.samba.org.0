Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 497871E506A
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 23:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hOrWbfVhRcFxTyrBg200KFr9cRw5LZKqwzAx8x2HDbE=; b=YO6ezgkXYMy8jGIyZll/iimai2
	8LA2a/Z+a1e4eh6e2xPYYL3q8xwCQisC1MbX48cQJvQTJ4Ksu0w5viCMm6u/0u5Mgij7jc8Z4AATz
	HepkDoRcYoirlOIcRnai5yqzelUklxMgA7+HrG0iPtek3GtbNx8+Gzf4LAbrg1mmF5rp1hHlAQYDM
	SjersgVhN4ApxpbXq5qAxPFgGxbn/rs1yxRC/jSTFTa/XQB/Oq3v3foIjVRXSZmEIrlbI4PN5grwX
	ArbIJ90jbmrwWPHdGps9Sckgu0uSrfRCXw4uWILqtZ+5MoaTj2KjKmM9yVwv/C+G/okPZccbDkNE8
	4chVdzYA==;
Received: from localhost ([::1]:24220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je3YC-0066GZ-N9; Wed, 27 May 2020 21:25:24 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:38285) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je3Y6-0066GS-Ex
 for samba-technical@lists.samba.org; Wed, 27 May 2020 21:25:21 +0000
Received: by mail-lf1-x141.google.com with SMTP id 202so15339349lfe.5
 for <samba-technical@lists.samba.org>; Wed, 27 May 2020 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hOrWbfVhRcFxTyrBg200KFr9cRw5LZKqwzAx8x2HDbE=;
 b=nvyzI4EbTJ6mgUUIDFJBdy22v3gYma7yFhrhT1cXvHQgjyi9R82T4p0vvqV9hBb7cD
 tpxVpoW0iK4bWzxHxV+dXN2DfgFd3ErL63FH5BSbjqyvjjbogF07NXlUgkZaw47R2qP5
 EspfC9gpogbfuGCfyzR4ljO/pkehd7dLNFbnicXq/1neRYZOkhhVyCIsVeYF52g9knbr
 K8wnS0i9pA0gtIWRMem0CI/APRki2gmYAFzAbcoFrb2HEe7SnM8G+pwZz0QYanQMinjJ
 2HQd8DYnlu3EHgF0y8hlcGPI8EeYktZMTBmlAihhZb4J/Si810HQghA1loCl+1mYviXJ
 kFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hOrWbfVhRcFxTyrBg200KFr9cRw5LZKqwzAx8x2HDbE=;
 b=GZQvZlkvPgJzsEbZh3zl2UXGJkfADtmXRw1I7Nc8n69RVG1uWCXqh3YmmOGhtt/cX2
 iIiP89H1BwB+TJ3vnp0fXK90MpKAAXECQM1rh7cdmCm05pzoKaQrcmJbhh9LUr2dxNWx
 avPYdrt24vG9Ofp9EdTP5QJLXABoCPD3XVmrfFMMCXfoFJLUD5p6kdT6g0Y/TCvxteKL
 aof10oqhCi6qqwpjY6M+bsi+YYSoeGcHwbumVeXmt2AUStR9tJcoR9snaffvchbH48ll
 rUQAxGgqf4IbaCmVnkKvwMiRCGOynwMSa7925uG9irfJnOB3yMPLScpGzW9kOmCflJpj
 ervA==
X-Gm-Message-State: AOAM531DYBxHd2wdRkErKU/hq3nOvfMPTy0HH4dxBklt8zZNPC/mnNCV
 CKHRFgGenjeCYPoOyWpERpwoZ2EkqGfBv6ysC/Q=
X-Google-Smtp-Source: ABdhPJyo9Av2Zq0nMyC8pC2elR2eLyI2QsogTQlVEDMIZ+Kz9ixqII+CrjSQozSPyimHHF5x609F2dBa88psSlb0X8E=
X-Received: by 2002:a19:cb92:: with SMTP id b140mr5266lfg.63.1590614714920;
 Wed, 27 May 2020 14:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8QyT0aYEyDAKMyVdSq8R0NDbsw+5JPFmQ3pS_pa730ybQ@mail.gmail.com>
 <8a7eda93-25fa-7dcb-1501-c3e4870501c4@samba.org>
 <CAC-fF8S+Qwba9CTRBo_OB2YGRCWHWJ8W7NkB7=i6ucOf9Ygszw@mail.gmail.com>
In-Reply-To: <CAC-fF8S+Qwba9CTRBo_OB2YGRCWHWJ8W7NkB7=i6ucOf9Ygszw@mail.gmail.com>
Date: Wed, 27 May 2020 23:25:04 +0200
Message-ID: <CAC-fF8Rjyuv3XAPdEFYBE_Og4FMFSRi-FLYS56JX=HPncEOwcg@mail.gmail.com>
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

On Wed, May 27, 2020 at 11:16 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 9:20 PM Stefan Metzmacher <metze@samba.org> wrote:
> >
> > Isn't that what 'net ads kerberos pac dump' already does?
>
> We should have an enterprise flag for net-ads-kerberos-pac-dump, I
> think I have a patch for it somewhere.

Or even simpler, if we find two 'at' signs in the impersonate client,
parse as enterprise?

