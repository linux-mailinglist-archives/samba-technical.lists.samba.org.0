Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C703B516D
	for <lists+samba-technical@lfdr.de>; Sun, 27 Jun 2021 05:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4ABtkD1s9mAEhA4NtrP4gst8wve3z0WbTksMxezz37k=; b=qMAXqM+P+C0TLoKtqtaeD4tVXg
	+H/3rZZPeT5HWJN6+v4YzsV8+AdK3YzAv4XLzU7X+M2cwkz/L65Qx93XlzVq4qUzdxZfVE84a71NZ
	AubeaT4JzcWPK8QiXvUlkcefYkg6+SVOpsdlq6H0prMcP9ntfO/NqSfTlfUP1Wgez7DyQMMJm3mQJ
	aH3+M5/eGh1CMwsIw51ea0aZ9UxsOkdmJVJvbLO3GPc8fGHe8llfouruQ47Hb1v7QmX7TK32EhA+D
	VB+W1m2YOqy3hzI6RSLCUGNLZ4rZhueltCLjwHSuGJBSfZPbtT5POzGD8aIWe6y1VfUlRQfR5fKco
	BzOMGNFw==;
Received: from ip6-localhost ([::1]:53512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lxLwR-008cVU-MD; Sun, 27 Jun 2021 03:58:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:45873) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lxLwL-008cVL-Mg
 for samba-technical@lists.samba.org; Sun, 27 Jun 2021 03:58:39 +0000
Received: by mail-lj1-x233.google.com with SMTP id d13so19191250ljg.12
 for <samba-technical@lists.samba.org>; Sat, 26 Jun 2021 20:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4ABtkD1s9mAEhA4NtrP4gst8wve3z0WbTksMxezz37k=;
 b=iDGDari5aZDe+ofldE9/HMedBGvwLAdNvqjIPPRhLg7ei/GqNHNYCPqnMKkkbQ5kVi
 nmAYYgRX6N/Wp/01nZnrsdf3UycTnt40fzPNje/MYrJDPkrxKEIZ/3bnSYjNNCz0k4YJ
 aVmHZ9RW8rOwGkOFFkZSV0DH7Wv/G0zifSu5z2MlYy7/xaSaB8PryEPfKreKv82ujFLv
 2smE+SjWH+2XLnsnFVAF73c1EfklI+o8JeEubz0hBSbuK9xEXaoL1ZS99MSKPydI79bU
 7WNp1B7c92fHjdNaeCtIGadXmB+jO0d4AsBUuUXSLOeEN3ziOLuo41tDZ7osd0k2O0e9
 /eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4ABtkD1s9mAEhA4NtrP4gst8wve3z0WbTksMxezz37k=;
 b=D/M5VSBc9QEWMg52ot6DxHtp2IcK6WwP9/5Fcy4OoBsIcMtTCWi0o1unnU7CDQ9HAH
 IS1iC/Bh7+o30mr3mjoDEWowQMrfonKBKLk6jZ0XhELqL/mtL6a3BYzgMxvDyFE45ec2
 xDdl10+825QuJ+EwzUBrmqkOmt7VAAVhCou3JSA75nlI6r16EnUBhZtcxXaFJlvTm5bi
 TwlkuPro6Q8bPg/gBHEjdVERbKxKVreDxo27MXrA24psZQzZOF+r00hd0EAXa3XOgB9e
 qb5t28vC4hOMYh5Uvw5ZNtL8ohzX02IDQeaSP9fbzU1eFJIe/omGjomVeRdOCHxgsqFH
 Ct/g==
X-Gm-Message-State: AOAM533PZZgjkFEc4AT8ME+uuQpUgIzBuBPPMD/BkyXLd1bvPiwT7E0t
 vdFw8AAh3G0xRTplLcGzGkfrku2F5tPmxu4dTHjQFFkT0bs=
X-Google-Smtp-Source: ABdhPJyXFFm4c+x9ws7IHF3jOqekc3Yvrx5bdS7TgIqYaI1tkzK5xnIdgaN+eUXwFi2mRd/XHkocKpfy7OvmK6Q7CAs=
X-Received: by 2002:a2e:a7cd:: with SMTP id x13mr14401178ljp.218.1624766311810; 
 Sat, 26 Jun 2021 20:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms9kX=kzHneUkRXOQ-McbRxEck4uBVOQmjHq6q0rhGTCg@mail.gmail.com>
In-Reply-To: <CAH2r5ms9kX=kzHneUkRXOQ-McbRxEck4uBVOQmjHq6q0rhGTCg@mail.gmail.com>
Date: Sat, 26 Jun 2021 22:58:21 -0500
Message-ID: <CAH2r5muDsZJ+VVuBWEfdtSCn8-ryn-A3B_XqEMQVqS0n8D=iLg@mail.gmail.com>
Subject: Re: Signing negotiate context
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The problem turned out to be that Samba was stricter than Azure server
in alignment - I changed it to 8 byte alignment for the new signing
negotiate context and Samba did not error out (although ignored the
context).   Azure was ok either way.

On Sat, Jun 26, 2021 at 11:48 AM Steve French <smfrench@gmail.com> wrote:
>
> I tried an experiment to Samba 4.13.3 and also to Azure sending the
> new signing negotiate context during negprot.   Azure ignored it as
> expected, but Samba server rejected it with "STATUS_INVALID_PARAMETER"
> (it wasn't obvious at first glance what was invalid about it but
> perhaps Samba wants different rounding than Azure).
>
> Has anyone tested the signing negotiate context (e.g. newer Windows)
> to Samba server?
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

