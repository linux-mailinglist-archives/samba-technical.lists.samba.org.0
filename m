Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 418EF75D1B
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 04:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zuHhT/SP9fj5V4f9/DZ0aZPY0yrn9ywyGYxvvpQiXoU=; b=XBTE48t8+IW4ZJ5ukImZ02A4EY
	9ylxLTzTroTY7pYTLDG9ykwLEYZciXs+BkxVWRdk60HY7V2yzgdIsxPjSa4DdZ+y7efnwV8jDz8cX
	hneHc4GindghfN7/rFz/U0lEM9qvxb1UjHoTyLerGzoPSZtqFLooKnBh1mJTrr/82PVCdWlyAIFZx
	3FsKShQMJmOutc+ErggnekgmaSarwi3F53jlkKpbJQqW3uYmA9LyAPk+S+9i5n3/Ev6r+OS/rUEBp
	cdcaSN6QvK5gbz9CnNXKQPN94R7lex0o01dSdMjfFNxdMc03/sN6hht+eG8XU4z0TqkPqRA7yLGOX
	eaOCWc3w==;
Received: from localhost ([::1]:49860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqq5W-000P6d-5L; Fri, 26 Jul 2019 02:36:06 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38165) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqq5R-000P6W-A3
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 02:36:03 +0000
Received: by mail-ot1-x341.google.com with SMTP id d17so53895881oth.5
 for <samba-technical@lists.samba.org>; Thu, 25 Jul 2019 19:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zuHhT/SP9fj5V4f9/DZ0aZPY0yrn9ywyGYxvvpQiXoU=;
 b=Nw0nuo/uXKyoIFe0F4Jvrpkoo1/1IhblcwzNyXIB3AdEm416eN85ksDzuCi3LO62yZ
 xp8GXHa9NsVPjo720u4hKUQ2hYZlPuVLGZEtOsV8nieUuPCexYthM7CbalKoitGNYimN
 W8A/Xu12vNVlaQ4e8SsQrOjlJFLvj52SHfR0MdclSD+LS/OSXKiPfFtAubJUWJw1fwLR
 8Iz+qDZ0KPiADBg3wKzg5d2RaV1WNTPHiDnfyI/P8LY+qbnBoSw6mvfXsYvJ+9bEeUkg
 lhsebjQgTE3YQ3EpZM6Sj/7ZPFUz64AEfKFjCdlP59pfcBxNARemWO5tjTrf8d+RPiXa
 qkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zuHhT/SP9fj5V4f9/DZ0aZPY0yrn9ywyGYxvvpQiXoU=;
 b=HCDKzDvJykt02XuiB1w3+mFqi5Ewskcu7h/oDGXoGnzy+PidPWtlBRZyQCRZbzBj90
 qsLlwM8niIYaMu34MAfb4Iqx3c8cs9YWLZZBR86XqEYCMx9EbYaRuWJUZxWQPsTG12O3
 i4a4R2ZF+QgjT0mmWmVZF8KaLLrDSDAvJRRzsn5nHJQiZrcPpJpHcQRuN7kuV+eXe+Wl
 ip/5wr7Fkqja2FgLVAn41NotL8hEI/jG6RA+Ak4lp1aphI2buKZtjiVKUngNRkhKlIwK
 Ewjs54olvnzGa1REQFFNflySFxaYSZouliTfynMv4VXtTz8hjj4Elp++6q8tG4eqe/1j
 xbdA==
X-Gm-Message-State: APjAAAVxkF13ipfvGZ7ZbfYb5s5VdPfRScJY9ekEVTgYf3klyl/wcya0
 OCjWNW2+VZ6JP1zvO9T70Kiyqjy/lIHnvIyiwQl+uA==
X-Google-Smtp-Source: APXvYqxpBdEsZ9/j033iE6c69wPo8C9hhMu8DrMKA9WNgM4018tZGA1tYXG++vWqIEKMSAdnQFlX8wJw0tEwExY67Ac=
X-Received: by 2002:a9d:4703:: with SMTP id a3mr41081150otf.183.1564108559355; 
 Thu, 25 Jul 2019 19:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190725155545.39c93490@martins.ozlabs.org>
In-Reply-To: <20190725155545.39c93490@martins.ozlabs.org>
Date: Fri, 26 Jul 2019 12:35:48 +1000
Message-ID: <CAJ+X7mQwUsfdKEUe0XoQ2qCuQz_Quqkw98aEVXa=O9zR1gFrBw@mail.gmail.com>
Subject: Re: [PATCH] CTDB: Implement re-checking in mutex fcntl helper for
 recovery lock
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 25, 2019 at 3:57 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> ctdb_mutex_fcntl_helper does not re-check that the file it locked still
> exists and is still the same file.  Add re-checking and implement tests
> for ctdb_cluster_mutex() and ctdb_mutex_fcntl_helper.  Clean up
> the 01.reclock.script event script and associated tests.
>
> CI pipeline running here:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/72839484
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild with a small change to the error message and
corresponding tests as discussed offline.

Amitay.

