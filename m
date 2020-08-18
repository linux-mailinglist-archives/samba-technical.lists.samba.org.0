Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3EF248BAC
	for <lists+samba-technical@lfdr.de>; Tue, 18 Aug 2020 18:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0yJ9ya4OHMZ9oxMbdyf0T0GMXNRejKUPsgURbnpbVNI=; b=37x0/gI//RWy3gGobz+E8d61wh
	QjXFtuyXkPqkhXINSrozXtIoKkcMrmkSzaQBVnQJVEkrYUTKrq4u2hk6+A32H/8TGDOJAnWfWA9mm
	smDP6f8Pqb5ZJKcnrz/8ULZZvjpQAZRoGc8p96XsxGGIXu9HSHz6ccWSO8w0hCTlWQQI8wWr7v+F8
	E+OFhDNSsQpuK0/dm4dGJJnA8aWPCa+YBT7S/WfG91IdQE0h5sKThqj6SMU6TGLQgWnwZ0Eq9ioM0
	ydzgMFBQe9wlmu2LcqiWClztJAx0cEfx/CJypfDh1SvKLMnbmWfCrizfNodRcm4bdZ5MAwpHewTYw
	SzRqmrUw==;
Received: from localhost ([::1]:56956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k84WT-00EEFA-6f; Tue, 18 Aug 2020 16:31:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56080) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k84WJ-00EEF3-0F
 for samba-technical@lists.samba.org; Tue, 18 Aug 2020 16:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=0yJ9ya4OHMZ9oxMbdyf0T0GMXNRejKUPsgURbnpbVNI=; b=a8LXMPUcqXMr42fWeSLE6VGI+w
 ZYtYQYRaGhUo6kvPeCAUmFJwKWUD1JonOtNVynETg1NDze2ydRuvzmM3yUkcPMThDtoc+0Duofo8T
 WzuEa2lE6kgIi8yGnm/+jXeV7kXVhvX4LBtLa5HXDqmig+FDbLHSe1O0RZyCZpZEo5Pv0OD8UHA0e
 ky2iQUWp1I2Rbu1xwJzpgie3R+ecXZuwhyB5vnwmX/ovnHy3EhR7o0uRh0IA22uwMfi1BgYhAf68Z
 SR7zsogwS+JBG9j7Qmg1jZvFZH7dL9ZaS1DMuoSMozRYXR7kLfi7vS27RrNeUd+fxg5DGs9c2hzt7
 E3h1FQ8IXx4U2PEdV0dgvZ3M5elKHyNaUTHipCZzYgT6EZHTCbIrZGgT6EzoOKl2fnk8wxqgIFdGO
 4uvy8B52WvDLy0i+yKD74ENdA4L3GCegCQJQLyr5cRmtRXkMoAoCVDaXjz6gzQnir3/5zxyMQaXbf
 lynpMPcXVSh/sL/pxuRKkhO0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k84WB-0008Ci-R6; Tue, 18 Aug 2020 16:31:24 +0000
Date: Tue, 18 Aug 2020 09:31:18 -0700
To: Pavel =?utf-8?Q?B=C5=99ezina?= <pbrezina@redhat.com>
Subject: Re: tevent: fd events do not work correctly for UDP socket?
Message-ID: <20200818163118.GA8897@jeremy-acer>
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 18, 2020 at 01:46:09PM +0200, Pavel Březina via samba-technical wrote:
> When I connect to a port over UDP and nobody listens on the port tevent
> fires immediately read fd event even though there is no data available.
> 
> Simple reproducer is attached. Just run 'make && ./client' and see that
> read_handler is executed immediately. When there is a process listening (nc
> -ul 3333) the handler is fired only when data is available.
> 
> This probably boils down to epoll_wait but not being an epoll export, I'd
> like to ask if there is something that can be done about it or if it is an
> expected behavior.

Do strace ./client to see why this is:

The key is here:

write(1, "File descriptor is readable!\n", 29File descriptor is readable!
) = 29
read(4, 0x7fffeee02750, 254)            = -1 ECONNREFUSED (Connection refused)

Your connect call succeeds, as it's setting up the local
binding to the remote address, but as it hasn't sent any
data yet the client hasn't noticed there's no one listening.

Once you do the:

     const char *msg = "I AM CONNECTED\n";
     write(fd, msg, strlen(msg));

call then the kernel tries to send the data, notices
there's nothing listening and so the read fd becomes
ready via EPOLL - it needs to return the error
ECONNREFUSED (we select for EPOLLIN|EPOLLERR|EPOLLHUP).

So when you call the read() in the tevent handler,
that's when you'd pick up the errno = ECONNREFUSED
error.

I don't think this is tevent specific behavior.

