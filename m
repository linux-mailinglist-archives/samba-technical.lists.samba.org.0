Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B009725CF8F
	for <lists+samba-technical@lfdr.de>; Fri,  4 Sep 2020 05:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Cr+8YAj09f7LF0Aq9vnMAu2imK08ctO5fBOGH+H2AeU=; b=wj9ZxC2Jn9zst4/qvTItQonI/N
	BhuC/IpbD8sHM0uy9h7ImXWjWKPvTVcrcJ9g/jwxYAkGO17qjNBKKz6evfwvbL2CAuBsItF7qXei2
	lbucS84/NcbovknRWKK0kN9h4wSSxuS2ouGCjaCS0/JaVrl/DocwXFTLE6DjBLvSNL3NrD0TrSaeo
	CuboWAGimBsCUnwlGRoQJJ2JcY8AiVypbxhuTqGt7buzoa58O3zwdOi9hrOkZK6Z6tHCMc/CdR3C8
	20GP4QboqBvuBle4ymKlTZo+0vdrtoxyOl2MbAyPy+HwJIk60eBpHdkhv+bBmRB+5EFyNB9LUh2gP
	O1dnwWgw==;
Received: from localhost ([::1]:56298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kE20j-003tSQ-Bz; Fri, 04 Sep 2020 03:03:33 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33109) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kE20c-003tSJ-Te
 for samba-technical@lists.samba.org; Fri, 04 Sep 2020 03:03:30 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id c17so3587946ybe.0
 for <samba-technical@lists.samba.org>; Thu, 03 Sep 2020 20:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Cr+8YAj09f7LF0Aq9vnMAu2imK08ctO5fBOGH+H2AeU=;
 b=NMWla/y++O/wnyOJoFjMCvGtDrw3uVSkvnIj8HdMI+gtqz+67qjFE1qPYIvAK0lc8O
 j4McG9gikbqSG8bKccBk2JvE+cTsJsZPdjrC4eM2+ByrZAh8nhk/n+PJniZYUprZ2igi
 g7APgRKzC9H4M+NXVAgsnB2MlGLYQlLE3H0Iv28K6XulZeD4Qrb3yGvNCdg6FbsUj5Hd
 4zOz7qoQt8WAWB1SgARPeRDTW4U9HH8D8otipn+GctfTvqn9A2K48joiaOgEWqNRm3xN
 BAQAxP1yXJPz+gbOFCwPWcfjLx/dQVW90j/8FZZkryrkB+/Gn9HRlsPiQohU2KfmOzyP
 a+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=Cr+8YAj09f7LF0Aq9vnMAu2imK08ctO5fBOGH+H2AeU=;
 b=KnL4JD2xII1zzj03le7aND/dwNvZK22U2FiuQ+ohRElWZ2fHoMp2irjXWLmUhfUBXx
 jYzWOEhv9XA5S8CfrtwkEPMZTM2/hDJwnVBLV36cnSUK4fM9RqoapFmLx8vWfEeTpv2P
 xYVOMiplrPC8cw/9Kyv4kHvHLlszXU0q0xI8AEEqmmx4KfD0yj6LUYwGKGLhwMF6806/
 Q0LTFX1BZ9/H3L3fTRVsNu989K81GfEkKEwuQ/qR8rjKVyTbSgFQkmLAPQ/MqJdUUaZr
 HjOEOqttkFaC+omPBCPz6pNabHZFuONDyAxtaxKN4V+K/bAwu3n2kGL3YvFNKriLWP1v
 bjHw==
X-Gm-Message-State: AOAM530582TJ2LWXGkMB2QCSZhVS/rAzaXi+TGlXnD0jtFstfZtEp+sQ
 +9hAZ8tlK4SCtNQNZP9hI38Ilt8QnKnUMQLhkV4G4AGPFhc=
X-Google-Smtp-Source: ABdhPJzcCVLCxRVhH2UJdLQtaoYmNQFnV8SD4RseJZje3CFIEHg6VDSNt2v9kdr6PDwtDaI+6jqqdd39kUCGt1VqHGo=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr6843939ybg.375.1599188602458; 
 Thu, 03 Sep 2020 20:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200903215242.GA4788@fieldses.org>
 <EFDBAD41-E0BE-4AEF-8E37-18A414CE8588@gmail.com>
 <20200904003242.GB4788@fieldses.org>
 <064FD529-9526-4F34-BBE9-E9CDAC2EED5D@gmail.com>
 <MW2PR2101MB1019BE158E3F96ED36AEF37EE42D0@MW2PR2101MB1019.namprd21.prod.outlook.com>
In-Reply-To: <MW2PR2101MB1019BE158E3F96ED36AEF37EE42D0@MW2PR2101MB1019.namprd21.prod.outlook.com>
Date: Thu, 3 Sep 2020 22:03:11 -0500
Message-ID: <CAH2r5muzO90OQquWBB2ALC7FyT=HFS=OnkLKsVhtv_8o6HjokA@mail.gmail.com>
Subject: Fwd: [EXTERNAL] Re: [nfsv4] NFS over QUIC
To: samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

---------- Forwarded message ---------
From: Steven French <Steven.French@microsoft.com>
Date: Thu, Sep 3, 2020 at 10:01 PM
Subject: RE: [EXTERNAL] Re: [nfsv4] NFS over QUIC
To: Chuck Lever <chucklever@gmail.com>, Bruce Fields <bfields@fieldses.org>
Cc: linux-nfs@vger.kernel.org <linux-nfs@vger.kernel.org>, NFSv4
<nfsv4@ietf.org>, linux-cifs@vger.kernel.org
<linux-cifs@vger.kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>


We (open source SMB3 developers) have been thinking a lot about
SMB3.1.1 over QUIC especially after the interesting talks on this at
the last few SDC conferences e.g.

https://www.snia.org/sites/default/files/SDC/2019/presentations/SMB/Li_Fran=
k_Surfing_the_World_Wide_File_SMB3_Improvements_for_Safe_and_Efficient_Inte=
rnet_Access.pdf
(slides 8 and following).

And some of the broader coverage:
https://redmondmag.com/articles/2020/03/02/microsoft-smb-over-quic-to-windo=
ws.aspx

I have gotten a chance to talk with some of the developers of the
recently open sourced quic libraries
(https://github.com/microsoft/msquic) and there are various code style
issues that would prevent it being merged into Linux kernel without
significant changes (not just to fix camelCase) but ... it is a very
very promising place to start.

One of the ideas being bounced around is to do this in stages - first
try to cleanup the kernel style issues with the open sourced msquic
project and merge it experimentally into the Linux client (cifs.ko)
since there should be SMB3.1.1. servers to test it against reasonably
soon (presumably we will know a lot more after the 2020 SNIA SDC talk
on SMB3.1.1 over QUIC in a few weeks updating us on status
https://www.snia.org/events/storage-developer/2020/abstracts#smb-Dantuluri)
after we are convinced that the quic driver interoperates ok then move
it into the Linux networking stack and let the networking experts
clean it up more and remove the 'experimental' tag from it when
satisfied.

More discussion is needed on this so we should add samba-technical and
some of the network experts as well.

I am very excited about the possibilities opened up by a decent quic
kernel driver, but the current cross platform open sourced driver is
fairly large - ~90KLOC so will have to be trimmed down (and a lot of
boring changes to convert to kernel style needed).

-----Original Message-----
From: Chuck Lever <chucklever@gmail.com>
Sent: Thursday, September 3, 2020 7:53 PM
To: Bruce Fields <bfields@fieldses.org>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>; NFSv4
<nfsv4@ietf.org>; Steven French <Steven.French@microsoft.com>
Subject: [EXTERNAL] Re: [nfsv4] NFS over QUIC



> On Sep 3, 2020, at 8:32 PM, Bruce Fields <bfields@fieldses.org> wrote:
>
> On Thu, Sep 03, 2020 at 07:48:19PM -0400, Chuck Lever wrote:
>> Hi Bruce-
>>
>>> On Sep 3, 2020, at 5:52 PM, J. Bruce Fields <bfields@fieldses.org> wrot=
e:
>>>
>>> I've been thinking about what might be required for NFS to run over
>>> QUIC.
>>>
>>> Also cc'ing Steve French in case he's thought about this for CIFS/SMB.
>>>
>>> I don't have real plans.  For Linux, I don't even know if there's a
>>> kernel QUIC implementation planned yet.
>>>
>>> QUIC uses TLS so we'd probably steal some stuff from the NFS/TLS draft:
>>>
>>>
>>> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fda
>>> tatracker.ietf.org%2Fdoc%2Fdraft-cel-nfsv4-rpc-tls%2F&amp;data=3D02%7C
>>> 01%7CSteven.French%40microsoft.com%7C9bab515f15bc49fbbe2c08d8506cee6
>>> 3%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637347776075883604&am
>>> p;sdata=3DpOnlPJcTkyJiqQm%2BCbo7dbOAqHMKFIi01qrShVZTH%2Bk%3D&amp;reser
>>> ved=3D0
>>
>> The link to the latest version of that document is
>>
>> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdat
>> atracker.ietf.org%2Fdoc%2Fdraft-ietf-nfsv4-rpc-tls%2F&amp;data=3D02%7C0
>> 1%7CSteven.French%40microsoft.com%7C9bab515f15bc49fbbe2c08d8506cee63%
>> 7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637347776075883604&amp;s
>> data=3DYYBPryN5sFJApWm%2BkQvmjYzGXxjxI1fXRUWVXvVGE24%3D&amp;reserved=3D0
>>
>>> For example, section 4.3, which explains how to authenticate on top
>>> of an already-encrypted session, should also apply to QUIC.
>>
>> Most of the document's content will be re-used for defining
>> RPC-over-QUIC, for example the ALPN defined in Section 8.2.
>> Lars Eggert, a chair of the QUIC WG, has been helping guide the
>> RPC-over-TLS effort with an eye towards using QUIC for RPC when QUIC
>> becomes more mature.
>>
>> I thought the plan was to write a specification of RPC-over- QUIC as
>> a new RPC transport type with a netid and uaddr along with a
>> definition of the transport semantics (a la TI-RPC).
>> The document would need to explain record marking, peer
>> authentication, how to use multi-path and multi-stream support, and
>> so on.
>>
>> Making NFS work on that transport should then be straightforward
>> enough that perhaps additional standards work wouldn't be necessary.
>
> Oh, OK, good.  Sounds like you're way ahead of me, then, I didn't know
> there was a plan.

That's all there is for the moment! :-)


> --b.
>
>>> QUIC runs over UDP, so I think all that would be required to
>>> negotiate support would be to attempt a QUIC connection to port 2049.
>>>
>>> The "Transport Layers" section in the NFS RFCs:
>>>
>>>
>>> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fto
>>> ols.ietf.org%2Fhtml%2Frfc5661%23section-2.9&amp;data=3D02%7C01%7CSteve
>>> n.French%40microsoft.com%7C9bab515f15bc49fbbe2c08d8506cee63%7C72f988
>>> bf86f141af91ab2d7cd011db47%7C1%7C0%7C637347776075893604&amp;sdata=3Dej
>>> gN6OuHrcDMzejeEKbaP5UiD1GAxHfQcPyLZZ45vbo%3D&amp;reserved=3D0
>>>
>>> requires transports support reliable and in-order transmission,
>>> forbids clients from retrying a request unless a connection is lost,
>>> and forbids servers from dropping a request without closing a
>>> connection.  I'm still vague on how those requirements interact with
>>> QUIC's connection management and 0-RTT reconnection.
>>>
>>> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww
>>> w.ietf.org%2Fid%2Fdraft-ietf-quic-applicability-07.txt&amp;data=3D02%7
>>> C01%7CSteven.French%40microsoft.com%7C9bab515f15bc49fbbe2c08d8506cee
>>> 63%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637347776075893604&amp;=
sdata=3DTZeoR%2FT22hg%2BkG0LllDEttlgdzv%2FAsH8PeXbdEHQ9Mk%3D&amp;reserved=
=3D0 looks useful, as a guide for applications running over QUIC.  It warns=
 that connections can time out fairly quickly.  For timely callbacks over N=
FS sessions, that means we need the client to ping the server regularly.
>>> Sounds like that's what they do for HTTP/QUIC to make server push
>>> notifications work:
>>>
>>>
>>> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fto
>>> ols.ietf.org%2Fhtml%2Fdraft-ietf-quic-http-09%23section-5&amp;data=3D0
>>> 2%7C01%7CSteven.French%40microsoft.com%7C9bab515f15bc49fbbe2c08d8506
>>> cee63%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C63734777607589360
>>> 4&amp;sdata=3DrF91Tq8OXHeN7W5iuSbtYotq1XBC4Zc8DGEGzwPUuTg%3D&amp;reser
>>> ved=3D0
>>>
>>>     HTTP clients are expected to use QUIC PING frames to keep
>>>     connections open.  Servers SHOULD NOT use PING frames to keep a
>>>     connection open.  A client SHOULD NOT use PING frames for this
>>>     purpose unless there are responses outstanding for requests or
>>>     server pushes.
>>>
>>> QUIC allows multiple streams per connection--I wonder how we might
>>> use that.  RFC 5661 justifies the requirement for an ordered transport =
with:
>>>
>>>     Ordered delivery simplifies detection of transmit errors, and
>>>     simplifies the sending of arbitrary sized requests and responses
>>>     via the record marking protocol.
>>>
>>> So as long as we don't try to split a single RPC among streams, I
>>> think we're OK.  Would a stream per session slot be reasonable?  I'm
>>> not sure what the cost of a stream is.
>>>
>>> Do we need to add a new universal address type so the protocol can
>>> specify QUIC endpoints when necessary?  (For server-to-server-copy,
>>> pnfs file layouts, fs_locations, etc.)  All QUIC needs is an IP
>>> address and maybe a port, so maybe the existing UDP/TCP addresses are e=
nough?
>>
>> --
>> Chuck Lever
>> chucklever@gmail.com

--
Chuck Lever
chucklever@gmail.com





--=20
Thanks,

Steve

