Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E587C6C0E48
	for <lists+samba-technical@lfdr.de>; Mon, 20 Mar 2023 11:10:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=blX3r6l6PeCERNzX6ixVHDrk1aTD1Br5/ghP7M0n+nc=; b=F5IaetgGsapvTWArpWDbDlVwgD
	KfWfHe/FvyugIcuPzpT3hlpevEURAY+YT1HHBMQkVVD+0Zn/2EsKF38eRXwJBcuQjkDNT1Z6dRwZX
	7vcl/juctxV1K0DOt2qqtLw/o4zb3ezVXiA+aO9Xl9EG/9ZrYDDYjHs1iQlySY6Xr5g5KbGvS5zkI
	zpbMzCzHOUftV4SAvMQcrYfpm0oyQkEJA4QJ3Q/WZidJQAGvzkhtyKViLl0KoNzOv3T1nTvV6atrr
	fqL7ZpF4zAD1ny/g9jfXYOCF68YticPAngGSAnA/2vt9zcArkn+MTuZCkdLs3Vxh4G1j3wVKSVjuM
	IUZUvRTg==;
Received: from ip6-localhost ([::1]:50340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1peCSd-003Wkx-20; Mon, 20 Mar 2023 10:09:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33569) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1peCSV-003Wko-KC
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 10:09:48 +0000
Received: by mail-ed1-x529.google.com with SMTP id er8so32702828edb.0
 for <samba-technical@lists.samba.org>; Mon, 20 Mar 2023 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679306981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=blX3r6l6PeCERNzX6ixVHDrk1aTD1Br5/ghP7M0n+nc=;
 b=N5vFW+U8oT0E8ZcUrVDk/gP0UwhQdYhTlmmAwXW3r4k9bh4gAKDj5/BgwVpIQ8uNqz
 ioU64ay0weIlcAIligieuGXP3hy281KBI3wyao7C6N273hbJ27Mvxf+dg3ijSZTeKGex
 1upplsEEiqyuFsgj9Ar/TkfZy+zOH0teEKNk9unR07wWQNajAdt5FTpbgKLb+lX+E1GQ
 eb/dsnnOOvL611fhIZ+YDAAoUkPYE0cS0f8n93mmSDrmlnK1O6WymzLl2wlODzbbOUG4
 gfHEYBcYMFfMkU6+hKbFYIWboB5aADc9/Xf8wjFNTm1m87B+A8Eq80JrT7DR899wsPA+
 j+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=blX3r6l6PeCERNzX6ixVHDrk1aTD1Br5/ghP7M0n+nc=;
 b=RPiWxyNJYZcJ0bLqA51f5qOKUyn8udhURYWsT9v7mWJoaSf2yFqyz1xZhPsySsmWdn
 ZrVQBV4UqGI2n7WccY4oA2U3dhKG+nSo4Qqo+KxepJ3dB/7fqfoL+8HR/h0e+FYjsl6g
 UeYruPIKmVeaXY2uLp37TaB3DCWRUY1d+SZoOOUuTvpKlo8INuTvn9joHf9fqjtuKNVN
 eiDE/QkOEpiYMErTGRr/JKKyiut3O6nO3qp/4q7BObKY2oiR93Fmp9SU3qgWda/FvOrx
 Onye/0en5+TvUv33rKMe2SUWhspPHy5FDzPQO/Wbq7+ityDuzyJqovyKOhhOTnBvr8Dn
 VKFw==
X-Gm-Message-State: AO0yUKXgTWsedWysC9Hhu4UHGio76jIN6zWe7m/yqj7fhBJrqlCIZom+
 4YWGrzFt11WSddX48c+xYmlCeZqbMmFso8sgiAkJIyQT
X-Google-Smtp-Source: AK7set9MEYkkgFtst3w6od0NG/NOUCJnN7awIUyMBYryMCMDmZjca6/zTeu0HaLfJxcuLANatRjIPdko0V0/qbkc2FA=
X-Received: by 2002:a17:906:1b4e:b0:931:ce20:db6e with SMTP id
 p14-20020a1709061b4e00b00931ce20db6emr3779442ejg.2.1679306980722; Mon, 20 Mar
 2023 03:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
 <ZBgbvnB76vjgkq/B@pinega.vda.li>
 <7d339362-a3f5-f58c-ff74-15c6bf839a65@samba.org>
In-Reply-To: <7d339362-a3f5-f58c-ff74-15c6bf839a65@samba.org>
Date: Mon, 20 Mar 2023 20:09:28 +1000
Message-ID: <CAN05THQwkdBopESUZF7fq+feZxKWqrboc81syJi2EbzGB2dGWQ@mail.gmail.com>
Subject: Re: mit-krb5 and heimdal binaries
To: samba-technical@lists.samba.org
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 20 Mar 2023 at 19:31, Rowland Penny via samba-technical
<samba-technical@lists.samba.org> wrote:

> As for pointing the finger at red-hat, well that is easy, they are the
> only ones that went on record and said there will never be an AD DC.

Just stop, please. There are no circumstances where this is helpful.
Instead of causing drama, investigate what the issues are, then write
code to address the issues or
pay money to someone to address the issues for you.
But this hostile red-hat hate trip does not solve any issues, does not
make people want to volunteer work for your cause and is only causing
friction and animosity between the few samba developers that still are
active.
This is very destructive to the project and team cohersion.

