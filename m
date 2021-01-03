Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB032E8A6D
	for <lists+samba-technical@lfdr.de>; Sun,  3 Jan 2021 05:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mlTWyUP6drbnfj+htpMtytpuW37BT9IdnIQthb2kRCI=; b=qLUloJqw5Udd+FLzJxFfEYspnM
	vEt36psyRTDEueCpcUv3jxE1IcoIbkgxZIUvNcsG9zMe9dHWkPLLEj9g/OGXkyxXZYMzOA+EpuxT2
	iu2tRHIYaTMMbjVbpnLAvMZIJC8F3OEuCMUoCArSVttMWyj8ftKZjV/JwSjzXX6jV5CKPI5ElOFHo
	AbdJuP0v8AzEJDBpnP7mFa9i7k2p3fdD6UJ/tYTeDWMNKcLn6n91itcnhZhNBouRfV8JMPqAN6vxN
	7gPoLZx+6eqeBmtb8OGha88m5Pp+Hx9KQqYwVlBUGk6W0GuXQ3r22R75qcBg06nKoc4fAhjqjXenK
	+DP4yd2A==;
Received: from ip6-localhost ([::1]:33130 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvum0-004cXt-PA; Sun, 03 Jan 2021 04:13:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvulu-004cXm-6X
 for samba-technical@lists.samba.org; Sun, 03 Jan 2021 04:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mlTWyUP6drbnfj+htpMtytpuW37BT9IdnIQthb2kRCI=; b=Ph+ZFDGGXUHDRb8D8xwnVB76aT
 NYRIXIupUINH+uCGQcAwo7O4tx7Y9+XzrNbczGWpw9FiZmdFGYv5J9ZplEQiyRJsx6OEXCbHBLk/U
 5Bsv2mKHB1wYDkDBQaJJ9iGa+1TpOBamNIZiw2BSUuoCHNtiUkCiFe6DLBnycaqh7LW/QDIMPWlb2
 RSVRaDDMYbeepu3cjdWoXL/7BdwffgIDOgUoMw2YnWq4TI/jq9gn3kEHEs36tr0FhZtnADWA4dQsW
 WEK55lF/KeR+X1tTWLDdn36yoBUaehzHBIyRzIKu/+5gmr8lULFXILO7iNcgNUBtPcQ/KWbMYVL4i
 +G2Bi7NDNwgEFkOu1INVz5Sr+5F3ow3pmBvMCvIbtrN07dddA/zFRxQWudk9sWTTQrrX3E29YxG1C
 ohir2OWXryCNI4Z1gFiRS8JCgfA/VviSAIe9EpOGcw32dxH892Cnepteq5y8Bw7REdLFyHvYRuA0p
 dHVKzIeNZgs9W/QokoTh+jej;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvuli-0005XH-8z; Sun, 03 Jan 2021 04:13:26 +0000
Date: Sat, 2 Jan 2021 20:13:23 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210103041323.GA162327@jeremy-acer>
References: <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
 <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
 <20210102052524.GA67422@jeremy-acer>
 <CAH2r5msZt0UZG5r5Z7=_jQf=-xgNz8zW7fZOnqncqeJHB=mOmA@mail.gmail.com>
 <20210103012116.GA117067@jeremy-acer>
 <20210103012511.GC117067@jeremy-acer>
 <CAH2r5muZ9tFZtHakrSf6Px2HGQTDUzg8+V52+NQaytKX_ZpHCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5muZ9tFZtHakrSf6Px2HGQTDUzg8+V52+NQaytKX_ZpHCA@mail.gmail.com>
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
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Jan 02, 2021 at 09:45:53PM -0600, Steve French wrote:
>> So just creating a file containing : \ etc. doesn't do
>> this - you have to misconfigure the server FIRST.
>
>I agree that with Samba server this is less common (not sure how many
>vendors set that smb.conf

No one sets it by default to my knowledge.

>parm) but note that "man smb.conf" does not warn that disabling name
>mangling will break

Patches to the manpage welcome :-).

>smbclient (assuming that local files have been created on the server with one of
>the various reserved characters, perhaps over NFS for example).  But
>... there are many
>other servers, and I wouldn't be surprised if other servers have
>sometimes returned files
>created by NFS or Ceph or some cluster fs that contain reserved
>characters, even if
>it is illegal.

Sure - but that then becomes a possible CVE for these
filesystem clients if they don't protect themselves
against server attacks.

What does *your* client code do if a server returns a
filename containing a / ? If you pass it up, the upper
layers may screw things up badly.

>> The SMBecho is due to the keepalive failing
>We (SMB/CIFS developers) would know that, but I doubt that all users
>would realize that
>(for example) creating a file over NFS with a reserved character and
>then reexporting the
>file over SMB with Samba configured with managled names off, or with a
>server that
>is less strict than Samba.   Seems like it would be better to print a
>warning like:
>                    "exiting due to invalid character found in file name"
>rather than killing the session and ending up with the (to most users)
>unehelpful error message.

True. Again, patches welcome :-).

