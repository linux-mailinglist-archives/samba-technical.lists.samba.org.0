Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36805478C06
	for <lists+samba-technical@lfdr.de>; Fri, 17 Dec 2021 14:10:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VOrNKDqeuDmIYC1CnDQzSwocRECXb6C0+M5VIi6hyW0=; b=dm3KVVCrUTQUOWwlFtaX2YyBp9
	c5oXwsSFUAOpZetykhp2yBjJ2rSOEyJLa6MvdCAq4tCUle5jR5Rl4VA7D3LmBaxiCw2jqKbHtJhtT
	tdSKlAboKo/yREQ89F29IrguMfhZK32eZfaGmryRqT0zp+reNJyu9tac3TJsRl/dmI4W+uYoNN3N7
	qbJjcExCqkVHpFdEK4Pin+km5nLv/yRgDiRKGn+ONENbupgnTGBm8Tq+W7RCtW447H4AC3Kar9rFW
	Hd+0RDV+6tneikhDLhEMDiTlPIBX0MyjsEwS//q7EXPWgBvo6p7X80RpG/DzBZBWXhpxa31vUxM+h
	I7a9xvhQ==;
Received: from ip6-localhost ([::1]:25692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1myCzo-0012uh-5Y; Fri, 17 Dec 2021 13:10:00 +0000
Received: from mout.kundenserver.de ([212.227.126.135]:51231) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1myCze-0012uY-VH
 for samba-technical@lists.samba.org; Fri, 17 Dec 2021 13:09:57 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M2NqA-1mvRpt3MaM-003qkD for <samba-technical@lists.samba.org>; Fri, 17 Dec
 2021 14:09:47 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so1550508wmb.0
 for <samba-technical@lists.samba.org>; Fri, 17 Dec 2021 05:09:47 -0800 (PST)
X-Gm-Message-State: AOAM533/ptzNeYyVXlabK1VhaLRNoCvswVY276tcL8uPknJGFJamn6I/
 ecPWsV11uT367yDwh02yqOr8L2e95SYiXiEv80k=
X-Google-Smtp-Source: ABdhPJz7G1Jphi5B+WPZUUBROjJfTQT5bMgaRQTtBbW6svcijGRnk/NTqL4833WgkZbH4dijpWWNsIR992CZFrm3sB8=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr2709166wmn.98.1639746587350; 
 Fri, 17 Dec 2021 05:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
 <20211216094426.2083802-6-alexandre.ghiti@canonical.com>
 <1956456.1639746081@warthog.procyon.org.uk>
In-Reply-To: <1956456.1639746081@warthog.procyon.org.uk>
Date: Fri, 17 Dec 2021 14:09:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1M-kDqe0uwzyfUiErOavoEi3bVpy4m4BPbBXQr6JrHdw@mail.gmail.com>
Message-ID: <CAK8P3a1M-kDqe0uwzyfUiErOavoEi3bVpy4m4BPbBXQr6JrHdw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] Documentation, arch, fs: Remove leftovers from
 fscache object list
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mnqSly7pUHEg+P0WEJrQGir2YF9+KIjHGWjZ3IcCAiK6QOm3cDk
 RSXylAREMXzK3llxl1tBDfdd0kgOznbxqroQPaE5r62DUaCHPCpWJIJkwOMJMJA98GoNlog
 yluUhfIUUy4mlaOfZPze3FJAjMp15pPy7+ujmub6osi55PPr8LB8bV3ix3jEOXw18TYGfqo
 PPI6XELpJlYxFroNYnCnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Run2DePwJUI=:YGl5ddI2KoCsDpouJCtdeR
 hLmY3OAkns/SBQpt/MgZHAE68d6jIiCALror/E8h4Ml02PPxe2+faLXm7nC/DpRp99hso17B/
 TiTjE/yoRy50iVL2oK9+jmgIpUVc00V7AbrBgwmh+bgNkaNTVx8345dr+Jx1k+NuDYaa/lzT0
 eAdat8mHOpbHvjwGaBXhijZvFbdBe9EZRhlx8J4C5FenXEFvyvD4OayKYbWLIlY03oQZg8/dK
 Mbh35DsV7nEYKh2p8JZW8JyVEJOD7cxbo1TVQu3LhPJoTrha8CKvYlqXZGQ4hLYkjp1t5JKTW
 ZMpPXwGazaJigX5UV58VLVWS6eo6LcVrEvm0m0VlLpf6BblAsGTap6XHtJhXkEsUXwVGyDoeM
 Eq+VuHq1QR2hCzbhwwgSNZ41KXB/zZ3JB2SoSBS0v8px2Mv45IwltYeHtfEHYf8FfLUt3mQWu
 9MJG3ovw6Y1JKx9SUDINRdcmG73tkmglutd6x0834faEuLVxuidYrqoVnnibQj+QC0vc87myy
 aXfGSpMvZRifzF/Q5H3lWmrYyfuIjaj9pwh0OAVe+VK5mPNqE8QpCXAAq8HquDGe9Rs4f9wKd
 Xj3p3iCU+r2MYcVkty0uuBvu1jncEKpFlsNic5R8EeC8vZ4v8Dk30gsouKkGPzIEJgHOD5450
 NdradQWstrnjjyzReN5czkaVLC9QX5qd9MNPb8XmO0k02XH1y0BEIqTaCFzkdlK9Dwto=
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
From: Arnd Bergmann via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-cifs@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 17, 2021 at 2:01 PM David Howells <dhowells@redhat.com> wrote:
>
> Hi Alexandre,
>
> >  Documentation/filesystems/caching/fscache.rst | 89 -------------------
> > ...
> >  fs/fscache/object.c                           |  3 -
> >  fs/fscache/proc.c                             | 12 ---
>
> Can you please drop all of the fscache bits?  They're dealt with by my
> fscache-rewrite patchset that I'm proposing for the next merge window[1].

I've dropped them both from the asm-generic tree.

       Arnd

