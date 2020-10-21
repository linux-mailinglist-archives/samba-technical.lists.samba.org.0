Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DA295259
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 20:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vArIQgAIYfSkG9o6jqMSmL+/LbHw8knD7b912UoX92M=; b=2t4i/naTdm/MZGsZQAW3wUCTmR
	chrMv39TnAiqjT+wY6Yc0txkidciB0M6EWEkxc1DA+iCAg/rB305non17vEN60CVDLG6o3iXdZVlF
	feE5fzYSber8cjDSu7LkRiswgzXdmJihj/MCzMd4s/Utj9NMo+WoUZ4QHEOA8r/BoNuQq+FI7Xvml
	RRm0p1vkAf/A4kxxrp4+CsVCUq3eTeuzxE8f7pThz8ncQVu1QJN567nMXmAK56vdqfJK6VCUve//N
	HqrG6PSDSEsv1A4Euv3dY8Jbil9oI3ZSjmNLBEuTDLT+2APSlxATONK4JzyxFlBHKvsClTSYdXPQj
	fS/bWSmg==;
Received: from ip6-localhost ([::1]:23768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVIz2-00DBeD-MI; Wed, 21 Oct 2020 18:37:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61208) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVIyx-00DBe6-Kd
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 18:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vArIQgAIYfSkG9o6jqMSmL+/LbHw8knD7b912UoX92M=; b=CleSIVc27Unuk3sKL3jUPrdPTZ
 v9q6F87EsBtkuSXtfbs0BJqBOi/9fn9SmsI+lag9ZUvcdH6LB+tF+tHrQNV1P3OnBPmRR5tvA57dd
 30XgpKNJ5feEYT9ncbwWiOfwl+U1BbdPRQ2GkjCS/BzTzVHc3aeoSH+Ua9J9mmww1wFazUjq4F07b
 r41fARhoqQeMJArQRbtgD4WB6NdvR2UidpiCFOweqXDAsR8lgfMqinAT4vh3iUICq7z8FcICBmx0Z
 VuWBXxV1YwmQ7nMlw1hZ8Y4HkLrMBZG8iWsVh7KWuwJQLZdfJQAClhf6CnW1leRpoI8iHlF35/aj+
 moz14ariBv2GkjT07yk/CTDxjMBpP1jvLGxGtUaIUViUqMx22p9Der96r23PzTL+UlPc/kuN4cIDv
 1h5dyKou35RI1iK8jIjGMPL496b3nExO26wxZL40BapqKLOYjqSK+fr1u+ZkgAfpc++mcNUfdjYAO
 UmjNpVV+oJKyl+1WIFs5+kWU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVIyt-00086U-VK; Wed, 21 Oct 2020 18:37:04 +0000
Date: Wed, 21 Oct 2020 11:37:01 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: Other minor issues/queries
Message-ID: <20201021183701.GA809738@jeremy-acer>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
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

On Wed, Oct 21, 2020 at 01:31:39PM -0500, Arran Cudbard-Bell wrote:
> 
> Sorry yes, I should have been more specific.  It clears the the existing
> name, and sets the name to be the program text.
> 
> There's a number of places where this happens. All the *_append_* 
> functions drop the name of the chunk and set it it to be the string 
> content.
> 
> For buffers its less relevant, but for structures... Well it just seems
> like a rather unfriendly thing for a type validation system to do.
> It seems like talloc_realloc* was originally envisioned primarily as a way
> of extending arrays or buffers, and not working with flexible array 
> members in structs, or struct "compositing"
> (https://github.com/FreeRADIUS/freeradius-server/blob/master/src/lib/util/ext.c).
> 
> The cost to fix this would appear to be two bits in the flags field.
> One to record whether the name was explicitly specified, one to
> record whether the name was originally const or not.
> 
> There'd actually be some efficiency benefits to recording const vs not 
> const in talloc_free_children. talloc_free_children currently walks 
> over the list of children searching for a chunk that provides the name
> for the context.
> 
> If we knew the context had a const name, then we could avoid that 
> additional O(n) operation in the majority of cases.
> 
> I'm happy to put together patches...  Recording const vs non-const
> wouldn't seem to be that contentious.  Preserving explicitly set names/
> types seems like it'd need more discussion.

That seems reasonable to me, but I'd rather Metze also
comment on this. It is a behavior change.

> > Second, I'd like to remove the memlimit code. Can you be
> > *really* clear as to what you are using them for, and
> > can we find some other way to do this ?
> 
> We want to ensure heap allocations can't occur when a pool is full.
> 
> a. In cases where these pools are composed of mprotected pages,
>     or pages that will be mprotected.
> b. Where we want to trigger allocation of an additional "slab" of memory
>     when an existing pool is used up.  This is used where we're performing
>     configuration parsing on startup.
> 
> That's it, that's really our only use cases for memlimit. We never use 
> them on any other type of chunk.
> 
> A flag saying "don't allow heap allocations" would be absolutely fine
> for us in all cases, and much simpler to implement.

OK - that sounds *much* easier. An additional 'uint32_t flags'
argument passed into talloc_pool() and talloc_pooled_object()
with a 'CONFINE_TO_POOL' flags being the only one defined
at present would be the way to go IMHO.

This would have to be a new major rev of the library
as we'd be removing the memlimit code as well in order
to make the internals of talloc understandable again :-).

Jeremy.

