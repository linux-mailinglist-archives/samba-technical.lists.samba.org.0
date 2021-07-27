Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC83D7027
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 09:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=u5tLPyUo8Twb8+ZkHU7wvlQ67Htk5Rw/mdodBWnxfPc=; b=GSgA2amsWWcIw6QHZmsf7Dtr5R
	Q755+ecC3p9lysy/Kdfgje34VdIkYwAiZ/mOYsUcHGWznjKotSjS88gf4wvxblp7BLBSyqD8fXb0A
	xJdPkiNyxqs/jL/zdQt8cjQpL7zrCSFSpT4ToeCOWuM11OALjhQYtoqCj+ZkHcZEl2WoIw1itCMSQ
	j6MQDuMc8NfiMJnuSqgnVXRTDX2gaKDqW/ccxZbF6hCKNHtxi6Fn/2Z03Ppu6SPmfjhFPX7fYNJQg
	fb9PbTuSeQTDSXj9NDrtIenuAqbIH0kufFE4IrKkvFO6E+7OzORQOu/ySqT8XskoDwYfewgLQOIFJ
	DWPkqgRA==;
Received: from ip6-localhost ([::1]:23752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8HKe-0013Rx-Ky; Tue, 27 Jul 2021 07:16:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8HKY-0013Rn-37
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 07:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=u5tLPyUo8Twb8+ZkHU7wvlQ67Htk5Rw/mdodBWnxfPc=; b=NfCtzF+B5coK3cVJB8+CGk6Kfb
 4Lz55SM60s4seAhpViHpDyxuHenYfBvAPyeY+lje+Lyi0AfaGKo6yWNuguXw/bQBXHNQroabIDz+I
 eRc7wTM7UiPRIgCMpIFyLh0QYktq3WMra5gSDK93ei1cDmDD0rKymnZzZlGK1QkNh2ou75ZdWCfrd
 0WvOrKBrX7xwoWn5a6rFTiiM7lxerWcFbBseD/N9trUSMQgwh9mFske3OfFcO+KD5aGvTDqvNjmWt
 sGzd7eYDcZwmlib+QoyxlTJMzk17L9U8JSJ9Ik1OUf1/i6F07frJcCuZ7/LICfwFNDg2qdIYzSArK
 x1SjdMRm7SxiJUL9cNEhxmov2NyQcZ8v/Vy3vyj0uDbIu1VH+bYKSJfzlFlyLpr35zjYxN10XkV41
 GGIGlpZjB5Awf/KlSnzbhgRfrChR62JGQ1bglCf99EU/dhP1DHbbAZHRUU3+O5tqg/32wwYfYrDcb
 8zUppOiQeTwhZlez8SUT/p4Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8HKW-0006Jf-Me; Tue, 27 Jul 2021 07:16:44 +0000
Message-ID: <58ab6c4df7d6baef011ee6e1b5900116466e5299.camel@samba.org>
Subject: Re: [Samba] Is "acl_xattr:ignore system acl = yes" recommended?
To: miguel medalha <medalist@sapo.pt>, 'Andrew Bartlett'
 <abartlet@samba.org>,  'Andrew Walker' <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
Date: Tue, 27 Jul 2021 08:16:44 +0100
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAJ3XT7iSbTZMsaWnFzq42FMBAAAAAA==@sapo.pt>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <754a4adf537fa6f92b4d75d8cff8f414ea49f952.camel@samba.org>
 <CAB5c7xpyq=CEGgrS2ONTPaG-w9W4Dki4zcGgcKoVgfxur-Zaqg@mail.gmail.com>
 <28f83edc900152a2323afb243dbb2b6682505326.camel@samba.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAC4N8FZIYQ9InghyXOwNYSIBAAAAAA==@sapo.pt>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAFfyUu6keMFJtGy7jPTqaN4BAAAAAA==@sapo.pt>
 <49d4df0c0d5602b69f92b02e1448a83d8457a5d3.camel@samba.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAJ3XT7iSbTZMsaWnFzq42FMBAAAAAA==@sapo.pt>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-07-27 at 08:04 +0100, miguel medalha wrote:
> > It appears that it doesn't ignore the system acls, it sets them !
> 
> It sets them to "access to everyone" at the system level.

Yes, I know, but something called 'acl_xattr:ignore system acls' when
set to 'yes' should, in my opinion, do just that, ignore what ever is
set by the Unix distro. Or am I missing something ?

Rowland



