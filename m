Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE61C78D9
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 20:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cubNOstQJemEvNzH8ZnubJwoJNUkZds2C9bCoeRv/Wk=; b=FCVNIU6p2Za5jUzAef3VcyVPSe
	XePpM8E8r7VcJG6JiOtMx40rXK8IQ2VgmdrGoikVqLltYvoVFlb3MJ6kFP5CSDQLJf4vf8KcjK7so
	9b/94wpKC6AbXiaqjcJAsaL0WQuLYZgWA9wmoVLQbKhRzSiLfoesKQ1ILhUKjAPIEOjOafC4ENCVo
	J5dMHLXIPWkq1UX+LQMh6uAGzQfwQKM82PBEcgYTFGPXm314eUiRa/PI/z/EdV68tx9BQKwLhKWBc
	I1C1twu/+PLyJvM7A1niJ9M1Qg426mIGjstd+IvRgLbGPsoShziyD9bAq9gw2tHZh7AZyrs7mBPQW
	ltwtsyEQ==;
Received: from localhost ([::1]:50732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWOMo-0033Dc-Ak; Wed, 06 May 2020 18:01:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48776) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWOMg-0033DT-OT
 for samba-technical@lists.samba.org; Wed, 06 May 2020 18:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=cubNOstQJemEvNzH8ZnubJwoJNUkZds2C9bCoeRv/Wk=; b=FWef2P4dxQEADlRGmJoUAjT8G6
 3b3515Tru6+DeJBAE9hXYWI493/a2r3kZMcsXyEP4m31dtMLCPfNUgZukfKnBBIz2/7RzeUPzFtcD
 PHI0sa665a1kFujxQ7R5L3SCbl0Azu5pvu/DLe2ZJGBySZ2cSX3emBmWEIOU9E6GrkvcCKAzQKIzo
 /Ehi7dNkLJZO+ek/tF+8orlVbuGGuCsdMP3e10ryhVVACqHWRWmlBylaMJxpC4/6ZQqE467b4cuUy
 Fdm0ijBVWmnWzNL+YxTcuPbfkxz5xqg6SutlFOyQ9eqSJtqBg0odcSRD7MW79DZM/GX0LhHPiOKTF
 fretgOnqyyv72mTZupLBy2ZfnBHYcnxkCnRyIZf83GZ2LQ4JHNmuW6g/+BgnM8fIHf7Nwiv7UL0yq
 WKHJjPV3sV22PkKZZSzHnOZjqx9KNsjuyzsEJBRqIJZc+/Jnk7hf0f0PhiZoMKwgYQd5tSMcr4ARo
 98DWYyDrDa9Y3jI18nLoM7I5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWOMZ-00006G-6J; Wed, 06 May 2020 18:01:43 +0000
Date: Wed, 6 May 2020 11:01:36 -0700
To: Stefan Metzmacher <metze@samba.org>, Jens Axboe <axboe@kernel.dk>,
 Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200506180136.GF3447@jeremy-acer>
References: <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
 <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
 <20200506170344.GA32399@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <20200506170344.GA32399@jeremy-acer>
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2020 at 10:03:44AM -0700, Jeremy Allison via samba-technical wrote:
> On Wed, May 06, 2020 at 04:08:03PM +0200, Stefan Metzmacher wrote:
> > 
> > smbclient is just smart enough to recover itself from the short read.
> > But the windows client isn't.
> 
> Well we pay attention to the amount of data returned
> and only increment the next read request by the amount
> actually returned.
> 
> I'm amazed that the Windows client doesn't seem to
> check this !

Confirmed. I just ran a copy test from a Windows10
client copying from Samba with the attached patch
applied (when reading from offset zero, reduce
the amount of data returned by 2 bytes to force
a short read return), and it reliably corrupts files.

Windows isn't looking at the DataLength field
of the SMB2_READ response :-(.

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=look

diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
index 378e48d112f..d21a3485536 100644
--- a/source3/modules/vfs_io_uring.c
+++ b/source3/modules/vfs_io_uring.c
@@ -294,6 +294,7 @@ static void vfs_io_uring_fd_handler(struct tevent_context *ev,
 struct vfs_io_uring_pread_state {
 	struct vfs_io_uring_request ur;
 	struct iovec iov;
+	off_t offset;
 };
 
 static struct tevent_req *vfs_io_uring_pread_send(struct vfs_handle_struct *handle,
@@ -319,6 +320,7 @@ static struct tevent_req *vfs_io_uring_pread_send(struct vfs_handle_struct *hand
 	state->ur.config = config;
 	state->ur.req = req;
 	state->ur.state = state;
+	state->offset = offset;
 
 	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
 				     state->ur.profile_bytes, n);
@@ -367,6 +369,11 @@ static ssize_t vfs_io_uring_pread_recv(struct tevent_req *req,
 		ret = state->ur.cqe.res;
 	}
 
+	//JRATEST
+	if (ret > 2 && state->offset == 0) {
+		ret = ret - 2;
+	}
+
 	tevent_req_received(req);
 	return ret;
 }

--yEPQxsgoJgBvi8ip--

