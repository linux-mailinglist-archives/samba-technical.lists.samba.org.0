Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650F139BC3
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 22:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6EhGobgHkCr6/LRUbgHtqrvQbB1X7h9pF0vdmKRCeI0=; b=cTtDuRz9wmkuUKen8TSb8LOllI
	W6jj02E0UW4rCv7LsP5dul7fCTw3qDwzXLRMz4/OJsP0FB4ZuMQkeKb+I+DcBctB6gyC1+aH45W0K
	nRZAcUDtZXGWuar78IR4JxGDmWGqjk0U8qlCNruCNUHLqiZOTGbIJXbeqK/1lMuMexQsR7koC4ffe
	T12P3As6NBN2njGDcptpWilRW7ZROmIK8N90cNubVy8Hy8k5sSL42onR+XHUd2htFuviu7AGy3u80
	oKMmgA2rg8IBy5uqjZzlf805crrOPXQap8Pc20LTpyigDlFO83gCy4NF+j6VEH6R+pgm2v/NMggQ8
	KswpX3rw==;
Received: from localhost ([::1]:58026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ir7QC-003IJf-F3; Mon, 13 Jan 2020 21:38:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54026) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir7Q8-003IJY-Bg
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 21:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6EhGobgHkCr6/LRUbgHtqrvQbB1X7h9pF0vdmKRCeI0=; b=Rr8lLVOoCDNSk3sXFjWVXSYPNu
 FCuDcvIjaSbzsAnBXxPJgqWWFvRckGTA0IX4GnlJeaawbclk77RUKXsKyc01FqunKIejGXmZ2ESh7
 KLdwVEBWVudQsDeZ7jVk8HdTG+XY+8jn8H6HsjoJFopNUi2nt8Pgz9i0b2sYBO/3EIW9N955tuHKw
 t4iicHOL3fMfPH8VBXN7q6qufomy1Btvy1lllxR3Qwd8P9+XMahp71Ds8Vh5Jaqv7iy1HHM657cIV
 H7VojSQOW7D7+WiUIQ8J9hxNNFx8mUu+coSiCbOJwUR99mZIVUNsQdKywyPBV5rsIkXQvY52z3a6S
 P9T+c8xRTvuYmJjYtaW6cWyXKPzHiyQGtGQWSvRhnFstFL5rGEr+zy2OY5iLcQT3MlGTk2H7YXyOz
 Ky/nsqOnKWibCMuvcNE5VV9s0RCSbktVDy6uKHau/6LoQuKTtESnjHRQX080GwN4SjPvkOYhPXGuB
 cAMDIwJS4G8t/dx/gwsWaZ8B;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ir7Q4-0002v3-U3; Mon, 13 Jan 2020 21:38:45 +0000
Date: Mon, 13 Jan 2020 13:38:41 -0800
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: [EXAMPLE] How to add a source3 fuzz target
Message-ID: <20200113213841.GB111855@jra4>
References: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Jan 12, 2020 at 11:00:06PM +1300, Douglas Bagnall via samba-technical wrote:
> Maybe you are a Samba developer who has noticed some activity around
> automated fuzzing, but you haven't really got your head around how to
> add a fuzz target in your subdomain. This message is meant to show you
> how easy it is. So easy, in fact, that you might prefer to skip to the
> attached patch.
> 
> My process for finding this target was:
> 
> 1. `git grep parse_ -- source3`.
> 
> 2. look for a function that looks like it
>    a. does a bit of work,
>    b. probably deals with untrusted data,
>    c. is not enmeshed in a whole lot of state.
> 
> So already with point 1, you know that YOU can do better.
> 
> For point 2, I saw this parse_packet() was filling out nested
> structures using a tree of function calls (that's 2a), has a networky
> sounding name (2b), and there is no context pointer involved (2c). (If
> there was a context pointer, that would be OK if we could create the
> context afresh every time, or if it wasn't really modified).
> 
> With the target selected, you make a file in lib/fuzzing with a
> function called LLVMFuzzerTestOneInput(). That is libfuzzer's entry
> point. LLVMFuzzerTestOneInput() essentially takes a datablob and
> returns 0 (always 0 -- you report errors with abort()). This is
> sort of enough to fuzz nmblib's parse_packet:
> 
>   int LLVMFuzzerTestOneInput(uint8_t *input, size_t len)
>   {
>           struct packet_struct *p = NULL;
>           struct in_addr ip = {
>                   0x0100007f /* 127.0.0.1 */
>           };
> 
>           p = parse_packet((char *)input,
>                            len,
>                            NMB_PACKET,
>                            ip,
>                            1234);
>           return 0;
>   }
> 
> but that's a bit useless. It [hopefully] tells us that parse_packet()
> doesn't crash, but it doesn't warn us if it is returning deadly
> structures. So we add in a round trip using build_packet() and a test
> to ensure p->packet.nmb.question.question_name.name exists, which I
> think something somewhere assumes is true. Anybody who knew anything
> about nmb packets could add more checks, which they would do by
> straight out doing the thing that might crash, not by making careful
> assertions.
> 
> To compile it we add a stanza to wscript_build using the standard mix
> of copy, paste, trial, error, and guesswork. Then you need to compile
> it differently. What I use is a wrapper around libfuzzer and compilers
> called Honggfuzz. The steps to get it are something like:
> 
> $  git clone git@github.com:google/honggfuzz.git
> $  cd honggfuzz
> $  make
> 
> then back in samba, you need a fancy configure line:
> 
> $  rm -r bin
> $  buildtools/bin/waf -C \
>                 --without-gettext \
>                 --enable-debug \
>                 --enable-developer \
>                 --enable-libfuzzer \
>                 CC=$PATH_TO_HONGGFUZZ/hfuzz_cc/hfuzz-clang \
>                 configure \
>                 LINK_CC=$PATH_TO_HONGGFUZZ/hfuzz_cc/hfuzz-clang \
>                 --disable-warnings-as-errors  \
>                 --abi-check-disable
> $  make -j
> 
> Maybe not all of those options are necessary, but at some point they
> were each for something. I think at least you'll need
> '--enable-libfuzzer CC=...'.
> 
> Then run it:
> 
> $  mkdir nmb_parse_seeds
> $  $PATH_TO_HONGGFUZZ/honggfuzz  -V -T -F 50000 \
>           -i nmb_parse_seeds \
>           -- bin/fuzz_nmblib_parse_packet
> 
> This will create fuzz packets based on the the examples in
> ./nmb_parse_seeds, of which there are initially none. It will mutate
> and add to these (initially mutating the empty string), trying to find
> packets that lead to new code pathways. While it doing this it shows
> you how it's going on a console dashboard. If a packet causes a crash
> or abort (or with -T, a timeout), it saves that packet in a weirdly
> named file and writes a report in (by default) HONGGFUZZ_REPORT.TXT.
> 
> To replay a packet in gdb or valgrind, you just do this:
> 
> $  gdb --args ./bin/fuzz_nmblib_parse_packet $the_file_name
> 
> and the problem should become apparent.
> 
> Needless to say, I have found no crashes with this particular patch,
> and I suspect it is not actually a very good target. But perhaps it is
> an excellent target and we just happen to have very good code!

Thanks Douglas, this is a *really* helpful guide - much appreciated !

nmblib_parse_packet is old code that has been kicked *very hard*
over the years, so I'm hoping it's just good code now :-).

Jeremy.

