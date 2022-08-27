Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8305A35A7
	for <lists+samba-technical@lfdr.de>; Sat, 27 Aug 2022 09:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=4LulemZ6MTcl2uCzNyrqKOGtu6NtXp5smADDcMxbnpU=; b=hBolg84qkn/K04vRgMq0ixDOu8
	Btclem+TsZ8xA/MFgIAloyg4wkz1HRrpZ2iqLMzrq+oJMdErT2/znBw5s7IM0+pp5zOMWgTqJKTLn
	lTG3uTlOYsy6wymFho6ZiuqvMXe828JNwhttiFdpE5D4zTH2bpqCowjvjjOiFL6H0bgSzqoLfDQYp
	meLxTcbQAdkqEmHh85ZGntrobYWSg20usmVuxFsbADBIamarDyOWLgxkahiFIONVYJ5xkDqk2cVgK
	dLdW/9eMIwv6OAFwyQ3Qqqx1/7VohKTC/FMvGYa7VVh1b0tDy1esgim1BMk/ZGz1XEaMUfYOZd3sg
	i4GHaJHA==;
Received: from ip6-localhost ([::1]:46286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oRqQA-002gHm-Pc; Sat, 27 Aug 2022 07:39:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oRqQ0-002gHd-6i
 for samba-technical@lists.samba.org; Sat, 27 Aug 2022 07:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=4LulemZ6MTcl2uCzNyrqKOGtu6NtXp5smADDcMxbnpU=; b=3w14FhkvSOhSEUJT52FBm0OHnd
 B+lHvMXL+7qSuKxnvsnl8YO4W84GGXAZbQBRgvd5Dv8shJQqGqhd/8/2AS06gfHv3TZgino7OAcd2
 os6lcO3G2KxrFzVslgHHi0VQkin6InoUj9IgTNkXpwpDdUqXcsHubO+bS+c5Vk45WB+r1FYeV1Dyp
 c/A2UR+MSJUBXEDh4lxwKl4+4SBk7F2trIw4yM71G2bFU6o7IJLDlDas2aMHxi0bL1bBmtyKuLuB/
 p3YNVvh8VU03SoPh3Bx4jRlTqQbp68n3r/zkV7q8d+gB+gjdFUMnyQLRx7tXl3E2J7V/t4gy/ZCoz
 N73eMtprP3cPjtIaSqTFBboAi0hOmC56vubarqmu/aoG3v/aUjBuHGsukYRCDC7AqO9tDVmc2KZy+
 1ewnR/TlJWdAdHSsKnPayKTQF6+rZLV48HAD4zdvBGFyn70AH/Ad8MiUq0RZ7s++edVsheRXUdtWY
 ozrDiaih3eM3HHdT9B5hnzOF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oRqPz-001xYB-62
 for samba-technical@lists.samba.org; Sat, 27 Aug 2022 07:39:47 +0000
Message-ID: <d4cb563ba2bfc6af910c238b89a0b8ef789c1a87.camel@samba.org>
Subject: Re: samba-tool error messages: what needs fixing most?
To: samba-technical@lists.samba.org
Date: Sat, 27 Aug 2022 08:39:45 +0100
In-Reply-To: <cfa3f458-f9ce-6671-5cc0-ab3b53103c9c@samba.org>
References: <cfa3f458-f9ce-6671-5cc0-ab3b53103c9c@samba.org>
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
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-08-24 at 13:22 +1200, Douglas Bagnall via samba-technical
wrote:
> hi,
> 
> If you have used samba-tool, you will be aware that it often reports 
> simple problems with long messages talking about exceptions and line 
> numbers and file names and all-caps error codes. Sometimes, well, 
> usually, these messages turn out to mean something like "bad username
> or 
> password" or "samba.example.com is not a real address".
> 
> Every so often (but less often than you'd expect) somebody has the 
> genius idea that samba-tool could just describe the underlying
> issue, 
> and refrain from the detailed account of subsequent woe. Even Samba 
> Developers have that idea, sometimes, but then they look and think
> "no, 
> too hard" and get back to debugging clustered inter-forest symlink 
> tevent races with S4U2SELF SPOOLSS ntlmssp_states (or winbind for
> the 
> extremophiles). But NOW I, fully sober, have decided to *actually*
> try. 
> Which leads to the question in the subject: which messages need
> fixing?
> 
> So *please* reply to this message with a samba-tool line that says 
> something really stupid, and suggest a better message.
> 
> It won't be possible to fix every example, and I will try to be 
> cautious. It is worse to hide real problems than to expose everyone
> to 
> horrible noise.
> 
> 
> Q: But won't this break the Application Search-engine Interface
> (ASI)? 
> How will we be able to find old posts on stac^H^H^H^H 
> https://lists.samba.org that quote the old nonsensical message?
> 
> A: Yes. ASI stability is never guaranteed. But you can always get
> the 
> old traceback by appending -d3 to your samba-tool line.
> 
> Q: But I like things the way they are. It makes me look like that guy
> in 
> the Matrix.
> 
> A: You don't want to look like that guy. Also, try -d10.
> 
> Q: When?
> 
> A: 4.18, and don't expect too much.
> 
> 
> cheers,
> Douglas

OK Douglas, here is one for you:

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13881

Running: sudo samba-tool domain level show -d0

Gets you:

ERROR(ldb): uncaught exception - ldb_search: invalid basedn '(null)'
  File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line
186, in _run
    return self.run(*args, **kwargs)
  File "/usr/lib/python3/dist-packages/samba/netcmd/domain.py", line
1051, in run
    scope=ldb.SCOPE_BASE, attrs=["msDS-Behavior-Version"])

Adding a search location, gets you:

sudo samba-tool domain level show -H ldap://dc1 -d0
Domain and forest function level for domain
'DC=samdom,DC=example,DC=com'

Forest function level: (Windows) 2008 R2
Domain function level: (Windows) 2008 R2
Lowest function level of a DC: (Windows) 2008 R2

Rowland



