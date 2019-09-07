Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACCAC3C6
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 03:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3WRfdm1tpYx1CEoQHUiyIfCHvUuNOYW8jcq/OoLI9ZA=; b=ABG1z3U+RTHQh3K2imC4lKHHwP
	USiZ9Y4CVp3j4gAU/snchxCgdS69ycCPqibxo9qjGvLdf+D+4AWB3vlP4PNd1MDcNt6gxzenxo7MZ
	w9HTy05sZ7F0+DoC+x9eephoxPU0Qb77zpmQKCLuUXQ+c7Dz9rCaUswADs+7AzgtkkiPifrQQLtWY
	YZPenQcwUijSSooSHAEaeoxOsNkiXKsF3Y8dE23DS2rG4M3p3svUWbtz5/B1CrOyKmbEM8HdBkSwL
	GhP+9kYYaJIhpbmiV9FeYSThtKpQ6nm4bu/OwnzqNnYNEfHF4ZEiZrJ2ekHr1oWsLoZVdq1py1xsn
	62zHSwcg==;
Received: from localhost ([::1]:42626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6P8O-0048R6-Gk; Sat, 07 Sep 2019 01:03:24 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45947) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6P8K-0048Qz-EN
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 01:03:22 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 41so3685931oti.12
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 18:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3WRfdm1tpYx1CEoQHUiyIfCHvUuNOYW8jcq/OoLI9ZA=;
 b=JlLFE/c8grrWGamafFRN6alOAwuP7PMz6Dli9+7WYYfU0w+0crnWSJ/bk+wJjngvW9
 9hp6bntFwtLKQnKQY7S3X/qAEpfZk22kUsa4NCkvlfeKFj2AJHm31BT4kPgh+z1mN+Zl
 +BuNy88ZOoQ55IkgRCugnlPYJpIlvUDCKIJB8hkrQFHPVHl6auoHMk1SF6xjN6g7xHU/
 ylI+866LxT3u1W4dDJHS6YmjT8e3bxFv32SPkZyKSmDxZ2eYgnjICgKq0xXFNuvQgo81
 rttL7HeHB3JWOpEWz/qmZhXSi3W454bwUOyTOYJq6tbxFtJUTV94//VdF4jJZ7TgMAgj
 2gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3WRfdm1tpYx1CEoQHUiyIfCHvUuNOYW8jcq/OoLI9ZA=;
 b=Ilmmny2mIZ396LsMtO8mBA48jNjumeNLTmyvkh6tEOgbcSS6FXp8lXOX7eamlMgNlH
 MIme1iyixRqs9AXHaaim+5ASBp9Ua0veiKpF0SCZrkLLMaLTO0xQcOXeRwE6hjYxreq5
 2D7IMzVKP5FA6JS1p4DZOmgMEca2wq+ZUOqRN8PiHC2A32Iq4K0kgWIvVDBHjDJVGL/T
 UVzeVBYkic3fkR41NXcDM1WW2rdF+keoPiNhauAvIuKCzpK8+ezuhWa9Ipf1zDcM0gNW
 me1v6JhTKhsIV3+OUxIWZ+xIq0d0hFVTIq0dYqsojq0HBp/ItZf/1ejJYNH/jemmI1Ow
 fEIg==
X-Gm-Message-State: APjAAAUuVQ+t4hAzHMGAYwX1hIYj7lnTWxntekl9EVM6QyOBkpMQRSrB
 h81zmld0NeAgF20859Fz9uklx3wdLINGjvHXvGo=
X-Google-Smtp-Source: APXvYqzdV6KHFSfOW1DjBeoVU7Db2Ne0EGE5UT9HzW9hY7acJf+avmlFg9Z0pnvb04BoIX0POl9iQP5MeT6duxpEroY=
X-Received: by 2002:a05:6830:1d8b:: with SMTP id
 y11mr9428617oti.242.1567818198416; 
 Fri, 06 Sep 2019 18:03:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:1d4b:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 18:03:17 -0700 (PDT)
In-Reply-To: <A79AF92E-3404-487A-8697-9FA6F3B1D69A@ixsystems.com>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com> <20190906161845.GA192819@jra4>
 <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
 <20190906230552.GA37629@jra4>
 <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
 <A79AF92E-3404-487A-8697-9FA6F3B1D69A@ixsystems.com>
Date: Sat, 7 Sep 2019 10:03:17 +0900
Message-ID: <CAKYAXd8jcnBhb_DqFGoQThpKArFi5iJ9F6D-dN4dthL6ubV5Ug@mail.gmail.com>
Subject: Re: samba performance difference between old and the latest ?
To: Andrew Walker <awalker@ixsystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2019-09-07 9:42 GMT+09:00, Andrew Walker via samba-technical
<samba-technical@lists.samba.org>:
> We=E2=80=99re same aio settings used on both cases? Defaults changed in 4=
.9 IIRC.
>
Ah, Could you please tell me how aio setting is disable ?

