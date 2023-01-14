Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A166AD3D
	for <lists+samba-technical@lfdr.de>; Sat, 14 Jan 2023 19:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tJ4I2+kGQp0jFq18r3oaQbBG/6QGMIIEVSgmjg/A278=; b=HPvULkNqlJGbpCDy/o21YcpzU0
	Abi2tFx2sNhBeMHg3Jpf/u632dkVipvJjg1Iz8UD/cwJ5cgikd9DSgfVKxhu2dn1VmvUeUrBsI5bk
	xL1zY/L7AbOtwsuFJHvcVHtZZmoVxldhnT7VtPKw72iaAWXsEK6BDpKjIWU1xRkmewBE1iu8TXNY5
	7dKuLpBJAFs66Il0mBGaXkcxwHuz2UA7EAw0ZJ2Z+UWdPln4H60DKJHN3gSS5/enIyj0UinxOzI8r
	fZnu4CuxvXZXylL1kASrxWz9HtqO9mbPrHmjUJj6xhY8ndxxYCYb315PeVUIT28rz6HXZa1eeYiWy
	L8o/Tp0w==;
Received: from ip6-localhost ([::1]:32140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pGl1D-00H2Xl-83; Sat, 14 Jan 2023 18:12:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:40798) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pGl12-00H2UJ-VS
 for samba-technical@lists.samba.org; Sat, 14 Jan 2023 18:12:34 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g13so37409698lfv.7
 for <samba-technical@lists.samba.org>; Sat, 14 Jan 2023 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tJ4I2+kGQp0jFq18r3oaQbBG/6QGMIIEVSgmjg/A278=;
 b=oIJsRpbpWfMnyX/de9Bi+AJ54jTQbu01aSmy8M0BinUy4WyTKc3JWn540INVhymiei
 mQwuSMIPg6Ulqz+wkw3AidX+ddfn6+GL78EdyW9WwHHmgukIkaHLdjxpaQwhspEZVVK/
 En3rjKfzhyZx1geu1ku1Dz9FTPV8OmTlcK4QJmi06DuhQ7WnLtJwRNKLxoTj1KvELDvu
 osrNncObjMw6e8PyT48aJQKJKcZ3ugT3Lm5TVyg4vJz6+R+iWjW+TJD2tkpSVyVxq2po
 LEiDlI/ui+bvFCpwuFZoJJq1+E3AyQzO7QAqR71u6OwN9wlg3ePgoExTqTSjKMP74k8s
 4WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJ4I2+kGQp0jFq18r3oaQbBG/6QGMIIEVSgmjg/A278=;
 b=OalK9adhWl9AbnSfonN6RK9QVFwLh98ZOUc9c49TNzB96a0yd2YpgIqC6saJG1CBcw
 /iM/vYrpc2kl7A39Ip7hukzooRHi4vFfnmHbR8VtRtMi/+/KXwgPpZdbHgP6In6vePc6
 83gwUXTv0bfwnqWGGqV++A8D7i3fDSBhWNFTOdjLgTsFrlYOvHWeNQzCqd6YoWGObUTk
 YQzc4Hg54jYHp0Tou+sT5eAYb9fH947VmKRYjseSXWrb4xmAkx5VA0BOqtQ5p07WNBB7
 3nlBF3oaDU651RnUsOWR774HsWSfILz3ueUYKPVu5Ay+YJYTENXnSXXX9wqTohOKDpvB
 yxQQ==
X-Gm-Message-State: AFqh2ko6puXLpoFH/nsx6DCGZn48z+ArC+LU3hAcaL34va+wfy+pbzCT
 D2m2uFsWA2hfjuzMeukYSTg3FrrKHG2/hmRCJ+g=
X-Google-Smtp-Source: AMrXdXvyH2VlCP28geTu0pnQSHpRJp5HLHtbdEpNMOm7rUlMmDhlBsdso4n9j/SemhctQimd8Rfcd8ey04XyrzykRjw=
X-Received: by 2002:a05:6512:14d:b0:4cb:3a2f:26d1 with SMTP id
 m13-20020a056512014d00b004cb3a2f26d1mr2121991lfo.303.1673719947706; Sat, 14
 Jan 2023 10:12:27 -0800 (PST)
MIME-Version: 1.0
References: <Y7zBtCZ/eRJCpjBf@work> <202301121449.1C2AEFC2E7@keescook>
In-Reply-To: <202301121449.1C2AEFC2E7@keescook>
Date: Sat, 14 Jan 2023 12:12:16 -0600
Message-ID: <CAH2r5mt=DLrN2F0wwhPpMicHZsGJF5nQXQk0ptYTJy2a9xWcwA@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: Replace zero-length arrays with
 flexible-array members
To: Kees Cook <keescook@chromium.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jan 12, 2023 at 4:52 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jan 09, 2023 at 07:39:00PM -0600, Gustavo A. R. Silva wrote:
> > Zero-length arrays are deprecated[1] and we are moving towards
> > adopting C99 flexible-array members instead. So, replace zero-length
> > arrays in a couple of structures with flex-array members.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [2].
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> > Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> > Link: https://github.com/KSPP/linux/issues/78
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook



-- 
Thanks,

Steve

