Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D4190CC7
	for <lists+samba-technical@lfdr.de>; Tue, 24 Mar 2020 12:52:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7xpQW1Agt313pHG6mym9NgGh5oLM7LZlZwue1j0A2Co=; b=s4mD9xblIr/tttqyATC9aU+q53
	8kb5TFtcEGS2Xa/1OX30GklJB+Hi51Y2wZPEyt0YB6yNN+ukqaSHTkAf8MBbDUR5gFfFSzNe8xd/d
	bS/LUZy5xQSyK8mjfvtCbuIRSNBWy3gZdhM+ODT6cArRBe8DoqtcYRSM0zQ1HXyUfmxU//2Kru44i
	62UooZhzL6xHkMEWEwVpBWd/w+EyNb+83H0omoQuwFAbsAn2U781lW/8bra8iLl3jDlrsYLVZOXjf
	aZhO5JD9Sjadt6WSznpuGNNxQ7jcMHu0eLUEHZF+UjRTQ6exf/kwhSMrBXzD+ff3FLUwzbXU7DoO1
	l2k5mvHg==;
Received: from localhost ([::1]:34030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jGi6Q-000YLr-Mu; Tue, 24 Mar 2020 11:52:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGi6J-000YLk-MD
 for samba-technical@lists.samba.org; Tue, 24 Mar 2020 11:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7xpQW1Agt313pHG6mym9NgGh5oLM7LZlZwue1j0A2Co=; b=b2EMmoPjL3ZK7eY//NVJMhZb0D
 irl2sU3o8GcWcBsQ7Qzzkd67sefhAMHSKDzmHv4EgyD+QzZIR2jWkvi+DQTAOzT0+x9x8ovWoLsTc
 omFLbotXhti4GKFb0JKARAW7isG0hNTw2GhsearwR2r3luafEpbFmH3tiWz7H33IzQmrnV5OulrUc
 B3I61Yu58D6vqxvQ0ntgqQSbUeiqb1vvdAGtBf7T7O96f5+jy0my4pqvimsdwhHvKAo6VT8/FSksZ
 FtN7LDWYSa9gUqlpjVbJmopX7W0eJ+9ikgsHDNo7Fy390xlaIMMEd/f4eXp2SETbQeiom2S7m3vuO
 shI5POhHqQ9YNzteN8kn8B3JTRNq/MLyN5cUvB3v10cjHwELaemFcevlQp4xx4BA6IOnlH8jkGV9D
 nf1qGcuFAmEFfcMnHSk6eNDAFQOKac5r/EJ2UUxGCMDcwgOylwyJ0fNjNoHcUqVTqOhC7oZS2/kwr
 OrFvfNiHZbNqQUu8/8yKtpip;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jGi6H-0005DW-Ej; Tue, 24 Mar 2020 11:52:05 +0000
Date: Tue, 24 Mar 2020 12:51:46 +0100
To: samba-technical@lists.samba.org
Subject: Re: git signoff+ and review+
Message-ID: <20200324125146.0479f8a0@samba.org>
In-Reply-To: <2070261.IvKQ8U6GgO@magrathea>
References: <2070261.IvKQ8U6GgO@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Tue, 24 Mar 2020 11:00:11 +0100, Andreas Schneider via samba-technical wrote:

> Hello,
> 
> as a daily task I have to sign commits and also add my review tag after 
> inspection.
> 
> As git-filter-branch has been deprecated and the replacement is git-filter-
> repo [1], I've written some really nice python tools to make my life easier.
> 
> In a git repository I and do:
> 
> git signoff+            # Add my signoff to commits I authored.
> git signoff+ --by metze # Sign commits authored by metze,
>                         # because he forgot :-)
> git review+             # Add my RB tag to commits I'm not the
>                         # author of or which has my sign tag
> git review+ --by metze  # Add review by metze

These look helpful. Keep in mind that git comes with a built-in
interpret-trailers command, which is also pretty useful for this (and
handles duplicates, etc.). I have the following in my git config:

[alias]
  # add a Reviewed-by: David Disseldorp <ddiss@samba.org> trailer to top commit msg
  rbm = "!f() { \
    t=\"Reviewed-by: $(git config --get user.name) <$(git config --get user.email)>\"; \
    GIT_EDITOR=\"git interpret-trailers --trailer \\\"$t\\\" --in-place\" git commit --amend; \
    }; f"

  # add a trailing Reviewed-by: $1 trailer to top commit msg
  rbo = "!f() { \
    t=\"Reviewed-by: $1\"; \
    GIT_EDITOR=\"git interpret-trailers --trailer \\\"$t\\\" --in-place\" git commit --amend; \
    }; f"

For batch reviewed-bys, I use "git rebase -i" and run "git rbm" via
execute hook.

Cheers, David

