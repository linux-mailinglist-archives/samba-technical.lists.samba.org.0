Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E13A56FA
	for <lists+samba-technical@lfdr.de>; Sun, 13 Jun 2021 09:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/SzX165S6YaFLgxrscDJjf/BqOJk7y45HK2TsgsChIM=; b=P1bP9sO600jEIUaYEad4AEM/4I
	gLqlOD6g/f0YbgTW3s05MBxjBxI+Nv7f14BcuPn8zanfuIzvKS/3/bvEPQmJLOg2/DiL52B9iu0Zc
	sSbBtwIZZNdgXKDDWlbwuaNtrpJLI6sSZeyY5m+Q1YnKs6wNEcJoTZaeEy6i5zMoZd1CZ90T7chZq
	4om5cHddx9PYmaprw9ijAIbx4+XBzit4qb8z0TG5TLC4fjmYYVJEYUIsrMi8JQ+VZUD30LZtoAk2B
	92Fxc+oPmx1M8IcIqbcpastjIp4VoEEW7tFraoSw0RDPvP4518I8sf+/oXKhdY+jcI2WdvfgwRHy/
	KDHp96VQ==;
Received: from ip6-localhost ([::1]:31244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lsKra-005PZV-Mn; Sun, 13 Jun 2021 07:48:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59096) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lsKrR-005PZM-1t
 for samba-technical@lists.samba.org; Sun, 13 Jun 2021 07:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=/SzX165S6YaFLgxrscDJjf/BqOJk7y45HK2TsgsChIM=; b=XgOhGH/mFx/EM9hCw/4h+JGeRu
 qT5H4zPZLPjgzXH/g0zoDujOcoJARCoU+p7V7fsWQiuiN23fRGqbxxljSRhtbo3IdyIaMpFhuGXqo
 CUH1qc+s9BoucEO4FaCg3F+OImQgUShIhG6OMyKjJKJkH/Ktpt2L+e2EVVjPSD7LM6axxzhOj9Rn9
 n7LrundJdpqje6mnjV34ZWGFew0NB8OUO2MBXMaJCj+lqN/1O3vvt1oae+CYQFFqBM1Xz0Sw7vL9a
 A6a/MIBWbeJKIGd1aL6TKWM1f1Cnk11B3XXQjU9E39Ox4UKoaBIIZldyeaIIMu3ufFnFe43kEKCa6
 wVjgmfxitsNBw1f7EwBt1oZUKDgwRIPq6o7A8GyMNSg7/V3oIRXbaVCcb+asJAlm2y8754kXOeai+
 8R1cr34966R7A4SCXJCN7Hc+5zJHbxmK2g1/o1BgVbCFWU0q2E5K47QTv/Nt+uo3Ro2cgKuUo5vnW
 SVSbLZBNNc4/X+etBv67qhu7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lsKrL-0005Eg-UB
 for samba-technical@lists.samba.org; Sun, 13 Jun 2021 07:48:44 +0000
Subject: Re: Is it possible to mount a cifs share with kerberos using the
 machine account (with active directory)
To: samba-technical@lists.samba.org
References: <CAJwt-Jns5=XneYgidODs+SjJmWvoq=BhwbvRA0Z4SDKLgdZs3Q@mail.gmail.com>
 <CAH2r5mvv8dn+u9JVMJo0dvQ_Nk2esO-uDY4J=equS6AcMgSbOg@mail.gmail.com>
 <CAB5c7xq-OrQ2VCAm3xuA2VoCj=Ek+LDpP_5AhjM8v337=0cG0Q@mail.gmail.com>
Message-ID: <af48d6cd-c465-4841-704d-8e8fce8c1bb5@samba.org>
Date: Sun, 13 Jun 2021 08:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAB5c7xq-OrQ2VCAm3xuA2VoCj=Ek+LDpP_5AhjM8v337=0cG0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/06/2021 02:02, Andrew Walker via samba-technical wrote:
> On Fri, Jun 11, 2021 at 7:57 PM Steve French via samba-technical <
> samba-technical@lists.samba.org> wrote:
> IIRC there are some applications that will use the machine account to
> perform operations over the network (like backup applications). Whether
> this is successful against a Samba server depends on the configured idmap
> backend on the Samba server. If idmap_rid or idmap_autorid are used, then
> it _should_ be possible. If you're relying on rfc2307 attributes for
> idmapping, then it's probably not possible  since they can't be assigned to
> computer accounts IIRC. This is hypothetical, and has caveats. I also
> haven't tested with linux clients.


Yes, it works against a Samba server (which I take to mean a DC) and you 
can use idmap_ad. A computer account in AD is just a user with an extra 
objectclass, so a computer can use all the attributes a user can, 
including all the rfc2307 attributes.

Rowland



