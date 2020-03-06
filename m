Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AE17C016
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 15:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jjgrsfbK40vDTdnS2TEhJjX/lVYgnpW0Ta8ydbMPasg=; b=K+qe/o/JXnS7jtQ2j243ZSE8/M
	Lo/X+Ww7zCTD8fBz4eriGpTv5bxiDfJx3z6SgWUhm+R06HsAOO/iE+qK3cOBGjmyHekxaajyx9ss1
	a1PIlWKdOZv1YaXBFdU6LT04qzv8YuGCvWpWykUp9XCFSRP47dYSirBcb9ue6C8PHiIv/ArwIK/s5
	vtOLP2uHx4ZSV3uiUb+YFIYAd9cefau3GdMvZZMo9nyTJjFyXXTygbDFtXIOwLem3sAgdpyGecW4Y
	3PuSxvUi5JeEnUacOLrOv27OCByfQBF42axsYGctdT0w5PVA9N8J8BFXU2Xn7caYQAaTR1yeo4MUs
	wBa4xG6Q==;
Received: from localhost ([::1]:27914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jADp8-00FIkI-NM; Fri, 06 Mar 2020 14:19:34 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:36190) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jADp2-00FIkB-Sq
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 14:19:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id s1so2063836lfd.3
 for <samba-technical@lists.samba.org>; Fri, 06 Mar 2020 06:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jjgrsfbK40vDTdnS2TEhJjX/lVYgnpW0Ta8ydbMPasg=;
 b=i73CHQ+3DueUnNk8mEcMtIdSb2s4pOPJuHngaQYXYwJLWT983QiuRefjEAB6YwxWOL
 VGojO/3q7BL9oAhWcOcyCXCszOFl1Hgpttwi2YE7l50PYJ1xhpC7uMqu3tTKF5jm+TYD
 vrXLfkaGBZGPYEr0I8nUCWL3OmOND9rPeYoCsmr6U2VvprmtKf/uY8DyxQc4t9JTD3B1
 2UyyVQItBK900iZA7ppwOQPGikBAKSDKefgSWU6cawcA08iTb05g90IP968aJIpTTQ79
 5BB4vrdXLHsWdaXA7yKiZHB4BLEim5KIRBiA0SmM/TBoB5La0NNGSeRZtSdD4PR9Muq4
 Qa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jjgrsfbK40vDTdnS2TEhJjX/lVYgnpW0Ta8ydbMPasg=;
 b=UmlBeK0wia/rTbnJ1ghWlapLR4OCWiHj9X1GEHiFz+261PTibsC0NkzPfhjUJfefvq
 OUC5cKPwJ4BBL52BnHvzz724dJ3+w70cZ/wb2FQd3msbjT8Jb88W+Os698k+SaK1O2b5
 Ck+Ws88bW/mugVlTbDkhXgyIj1DvMp7L42a5pv7nPhS4mThv+mENQAhlamXXqLnTwtfl
 m5wa3VIBNNNUGAWoB/PC98HnMqyZ4T4RZXC/Kzvkeq24pjB1IHVXnrRdYi9ufZ04NtvX
 hSQYMd7pa1q/KA0DKi3dY//GdnrLLm2ZOAjCMtPIrZWELJ3l52Romx/h8koAHsk36O2J
 oX7A==
X-Gm-Message-State: ANhLgQ1GdT3yK9VavJ/uaFAUo7+44i7LjhTnDo5i7aKuHJmoCH8yGRx6
 Dgc/yG+To3gcN2RrtLGWRvfVDk+MfXA1fEAqCtU=
X-Google-Smtp-Source: ADFU+vuhGiRPbPEzkWcN7XV6w0SmJ0PSNQ9p4Qhz2mASmR0IVswYptbzLHc0cAIOLy1BUTU+85U1vljgoT/psl/WITY=
X-Received: by 2002:a19:520a:: with SMTP id m10mr2152130lfb.30.1583504367849; 
 Fri, 06 Mar 2020 06:19:27 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
 <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
 <5b8bae24-553b-25cf-b942-6d6b2404d8c0@samba.org>
 <CAC-fF8R8hsBuCeGQX99ZVY=C7vuEuCf2L+KNbdGARJorSEzoAA@mail.gmail.com>
 <089d3ced-cf08-5276-daaa-54eb54b87850@samba.org>
In-Reply-To: <089d3ced-cf08-5276-daaa-54eb54b87850@samba.org>
Date: Fri, 6 Mar 2020 15:19:16 +0100
Message-ID: <CAC-fF8Tm3ce4gByhHTgDieMux4ZZX_4DoHcbBP2A7PQT9Nm_wA@mail.gmail.com>
Subject: Re: Using vfs_fruit alongside vfs_recycle
To: Ralph Boehme <slow@samba.org>
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

Hi Ralph

On Fri, Mar 6, 2020 at 2:41 PM Ralph Boehme <slow@samba.org> wrote:
>
> Am 3/6/20 um 12:48 PM schrieb Isaac Boukris:
> > https://bugzilla.samba.org/show_bug.cgi?id=14316
>
> thanks!
>
> May I push the patch with your +1?

The change looks fine, but I'm not so familiar with vfs and the flow
is unclear to me. I'll look more next week.

Thank you

