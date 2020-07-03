Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A952133DD
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 08:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=wxGJcFatOu8VQEFs2dUEtd4tBR84xJVJzNZy05jSt1E=; b=c5qiWxdn7oS/qoybJEGgAdeCQQ
	r8HrI9wgXfvLCHmZU1heuOMF5tUz4mo2VV7X9M8p1+1fgQHgCh9tviGWkklx7GR2niXWlxLr/ab3R
	SwDOZjI1VpdNMXibj/cx4RteYB7mposnGqMGFfAaIMO5uQe+cLrbFA5T+F5MwI8zeGEb2/Ty4Q9VS
	b5crZq/SeUBPc2tWfDhLHvJfhpOY7B23DU8Ce/Cq8urMAo8S5CLXTtOROOpp515o44pgt/WP1Fkd7
	fRXh7o2ZhigGnaQgA0WyUre5KtMIpH6pEk4r7PTTR3QH+yROM64J4p7U997KYM+AepiAkM1bhUMRv
	19ihgUlw==;
Received: from localhost ([::1]:49182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrEqp-005DTF-5c; Fri, 03 Jul 2020 06:07:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrEqg-005DT8-GP
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 06:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=wxGJcFatOu8VQEFs2dUEtd4tBR84xJVJzNZy05jSt1E=; b=SrzUfI7mAVq57wEZOtIC0G/ZvP
 d/3VBsb9Z/VMCJvhRUcnmp3XI7z3uca9Ri2Tcmu/xOjz47ZIk/oETp7oEMSE9UqvnQo6ug5UZJslA
 ar6W0Cy/urEczudKSUKGQtNqAYXHdZBOYWNHFqdPs+Hxcut2UOvAsBFyAazoZVwXITuVYk4DIfui7
 7BNg9yGUDrgC+MJaH1ojCQekfEL+puBsu9eU1UKJAHhr6UEoCtVrlCRdgk8kJGi3yjNHxI4lWkGfm
 jxBXauioD+08X1o8zOJ4R9xGsRbwoueX+KOEJBRQUuaFzLvmv1g43+ilXogi6Vg++vPISu9IzyFqv
 4AB0W/xPe5tMOqkyHQIqdOdjFm/54DosGH8DQyJHKllUWZnuh4LcSB4qKgesjseDxYJbj2fFJ58ZH
 SpvHgu0SYMOER2TZoyGQIIyyv/EFVDHNyvPz0Z6tWP3WERd9EQDElai5K0mTHhuG7mXXKpRGTgqLy
 vXzFeQUxt/NtZ4k+5OxGNyTg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrEqe-0005w2-Vd; Fri, 03 Jul 2020 06:06:57 +0000
Message-ID: <b77f985914dcacabf876f37851375b3f5436e77d.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
To: Stefan Metzmacher <metze@samba.org>
Date: Fri, 03 Jul 2020 11:36:53 +0530
In-Reply-To: <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-06-30 at 18:28 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi Anoop,
> 
> > > > I guess it means we would need to undo some of the changes we
> > > > made
> > > > to one array of socket_info structures.
> > > > 
> > > > I'll let you know if I get the basic passing of information via
> > > > the
> > > > tmp
> > > > pipe working...
> > > 
> > > As Samba does not require that the socket is usable from two
> > > processes
> > > at the same time, I guess we can take a short cut and just pass
> > > the socket_info structure (an array of them) through the pipe.
> > > That would allow us to have multichannel tested in
> > > gitlab/autobuild.
> > 
> > I am looking through your changes and will let you know in case I
> > need
> > more clarifications.
> > 
> > > I'll see if I can get this to work. Once we have these basics,
> > > we can try to improve the design to be more generic with shared
> > > structures, when we really need it.
> 
> I made good progress, see
> https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing-unix
> https://gitlab.com/metze/socket_wrapper/-/pipelines/161689331

Great. Those preparatory patches from fd-passing-prepare branch looks
good to me.

As I look through the additional patch from fd-passing-unix
implementing the real logic, I am getting to realize the mistake(a big
one) I made earlier w.r.t catching SCM_RIGHTS at wrong place. Somehow
things got mixed up in my mind :-/ Also I am still figuring out various
details as we have fine grained checks for another set of arrays(of
integers, socket_info structures) in addition to ones we already have
with current code.

I will try to expand test_echo_tcp_sendmsg_recvmsg_fd_array added
towards the end to have inet sockets passed and tested in selftest.

altogether wonderful work !!

> And for Samba:
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-multichannelhttps://gitlab.com/samba-team/devel/samba/-/pipelines/161691424
> https://gitlab.com/samba-team/devel/samba/-/pipelines/161691541
> 
> I'll add some more tests tomorrow and debug why some samba tests are
> failing...
> 
> metze
> 


